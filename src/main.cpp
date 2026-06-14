#include <algorithm>
#include <array>
#include <cstdio>
#include <fstream>

#include "Luau/Lexer.h"
#include "Luau/Parser.h"

using namespace Luau;

#define DECOMPCOUNT (3)
#define DECOMPILERS(X) \
    X(oracle) \
    X(luaexpert) \
    X(medal)

inline bool isDigit(char ch) {
    return (unsigned)(ch - '0') < 10;
}

bool isJustNumbers(const char* str) {
    bool valid = isDigit(*str);
    for (int i = 0; valid;) {
        char ch = *(str + (++i));
        if (!ch)
            break;
        valid = isDigit(ch);
    }
    return valid;
}

std::optional<Comment> findComment(ParseResult* result, Location& location) {
    auto& comment_locations = result->commentLocations;
    if (comment_locations.empty())
        return std::nullopt;

    // TODO: binary search

    for (const auto& comment : comment_locations)
        if (location.encloses(comment.location))
            return comment;

    return std::nullopt;
}

class Visitor : public AstVisitor {
    ParseResult* result = nullptr;
    std::string_view source;
    std::vector<size_t>* line_offsets = nullptr;
public:
    bool flag_ifexpr = false;
    bool flag_compoundassign = false;

    bool flag_var_table = false;
    bool flag_var_num = false;
    bool flag_var_under = false;
    bool flag_var_dunder = false;
    bool flag_var_under_num = false;

    bool flag_simple_upvalue = false;
    bool flag_medal_upvalue = false;

    bool flag_func_name_v = false;
    bool flag_func_name_f = false;

    bool flag_param_under = false;
    bool flag_param_dunder = false;
    bool flag_param_untouched = false;

    bool flag_forvar_medal_upvalue = false;
    bool flag_forvar_under = false;
    bool flag_forvar_dunder = false;
    bool flag_forvar_i = false;
    bool flag_forvar_j = false;
    bool flag_forvar_k = false;
    bool flag_forvar_n = false;
    bool flag_forvar_m = false;
    bool flag_forvar_i_num = false;
    bool flag_forvar_n_num = false;
    bool flag_forvar_v_num = false;

    bool flag_forinvar_medal_upvalue = false;
    bool flag_forinvar_under = false;
    bool flag_forinvar_dunder = false;

    bool flag_func_singleline = false;
    bool flag_func_no_header = false;
    bool flag_func_header_block = false;
    bool flag_func_header_simple = false;

    Visitor(ParseResult* result, std::string_view source, std::vector<size_t>* line_offsets)
        : result(result)
        , source(source)
        , line_offsets(line_offsets)
        {}

    bool visit(AstStatCompoundAssign*) override {
        flag_compoundassign = true;
        return true;
    }

    bool visit(AstStatLocal* stat0) override {
        for (size_t i = 0; i < stat0->vars.size; i++)
            checkLocalVar(stat0->vars.data[i]->name.value, i < stat0->values.size ? stat0->values.data[i] : nullptr);

        return true;
    }

    bool visit(AstStatLocalFunction* stat0) override {
        const char* name = stat0->name->name.value;

        if (char ch = *name) {
            const bool ends_in_numbers = isJustNumbers(name + 1);
            flag_func_name_v |= ch == 'v' && ends_in_numbers;
            flag_func_name_f |= ch == 'f' && ends_in_numbers;
        }

        return true;
    }

    bool visit(AstStatFor* stat0) override {
        const char* var = stat0->var->name.value;
        if (char ch = *var) {
            flag_forvar_medal_upvalue |= checkMedalUpvalue(var);
            if (ch == '_') {
                char next = *(var + 1);
                if (next == '_')
                    flag_forvar_dunder |= !*(var + 2);
                else
                    flag_forvar_under |= !next;
            }

            const bool len1 = !*(var + 1);
            flag_forvar_j |= ch == 'j' && len1;
            flag_forvar_k |= ch == 'k' && len1;
            flag_forvar_m |= ch == 'm' && len1;

            const bool ends_in_numbers = isJustNumbers(var + 1);
            if (ch == 'i') {
                if (len1)
                    flag_forvar_i = true;
                else
                    flag_forvar_i_num |= ends_in_numbers;
            } else if (ch == 'n') {
                if (len1)
                    flag_forvar_n = true;
                else
                    flag_forvar_n_num |= ends_in_numbers;
            }

            flag_forvar_v_num |= ch == 'v' && ends_in_numbers;
        }

        return true;
    }
    bool visit(AstStatForIn* stat0) override {
        for (size_t i = 0; i < stat0->vars.size; i++) {
            const char* var = stat0->vars.data[i]->name.value;
            char ch = *var;
            if (!ch)
                continue;

            flag_forinvar_medal_upvalue |= checkMedalUpvalue(var);
            if (ch == '_') {
                char next = *(var + 1);
                if (next == '_')
                    flag_forinvar_dunder |= !*(var + 2);
                else
                    flag_forinvar_under |= !next;
            }
        }
        return true;
    }

    bool visit(AstExprIfElse*) override {
        flag_ifexpr = true;
        return true;
    }

    bool visit(AstExprFunction* expr0) override {
        for (size_t i = 0; i < expr0->args.size; i++) {
            const char* arg = expr0->args.data[i]->name.value;
            if (!arg)
                continue;

            char ch = *arg;

            flag_param_untouched |= ch == 'p' && isJustNumbers(arg + 1);
            if (ch == '_') {
                char next = *(arg + 1);
                if (next == '_')
                    flag_param_dunder |= !*(arg + 2);
                else
                    flag_param_under |= !next;
            }
        }

        Location location = expr0->body->location;
        location.end.line = location.begin.line + 1;
        location.end.column = 0;

        // NOTE: if we want to check for medal's comment we need to use the below line instead
        // auto comment = findComment(result, expr0->body->location);
        auto comment = findComment(result, location);
        if (comment) {
            // here we could check for line vs Line
            // auto start = (*line_offsets)[comment->location.begin.line] + comment->location.begin.column;
            // auto end = (*line_offsets)[comment->location.end.line] + comment->location.end.column;

            // std::string raw = std::string(source.substr(start, end - start));

            if (comment->type == Luau::Lexeme::BlockComment)
                flag_func_header_block = true;
            else // we assume it's not broken
                flag_func_header_simple = true;
        } else
            flag_func_no_header = true;

        if (expr0->body->location.end.line == expr0->body->location.begin.line)
            flag_func_singleline = true;

        return true;
    }

private:
    bool isTable(AstExpr* value) {
        return value && value->is<AstExprTable>();
    }
    bool isNumber(AstExpr* value) {
        return value && value->is<AstExprConstantNumber>();
    }
    void checkLocalVar(const char* var, AstExpr* value) {
        if (!*var)
            return;

        char ch = var[0];
        flag_var_table |= ch == 't' && isTable(value);
        flag_var_num |= ch == 'n' && isNumber(value); // TODO: look into if oracle ever emits n%d for values that aren't a *constant* number
        if (ch == '_') {
            if (isJustNumbers(var + 1))
                flag_var_under_num = true;
            else {
                char next = *(var + 1);
                if (next == '_')
                    flag_var_dunder = true;
                else if (!next)
                    flag_var_under = true;
            }
        }
        flag_simple_upvalue |= ch == 'u' && isJustNumbers(var + 1);

        flag_medal_upvalue |= checkMedalUpvalue(var);
    }
    bool checkMedalUpvalue(const char* var) {
        char ch = var[0];
        int i = 0;

        #define advance() ch = var[++i]; if (!ch) return false

        while (ch == 'v' && !flag_medal_upvalue) {
            advance();
            if (ch != '_')
                break;
            advance();
            if (ch != 'u')
                break;
            advance();
            if (ch != '_')
                break;
            advance();
            if (!isJustNumbers(var + i))
                break;
            return true;
        }

        #undef advance

        return false;
    }
};

// https://github.com/luau-lang/lute/blob/primary/lute/syntax/src/parser.cpp#L220
static std::vector<size_t> computeLineOffsets(std::string_view content) {
    std::vector<size_t> result{};
    result.emplace_back(0);

    for (size_t i = 0; i < content.size(); i++) {
        auto ch = content[i];
        if (ch == '\r' || ch == '\n') {
            if (ch == '\r' && i + 1 < content.size() && content[i + 1] == '\n')
                i++;
            result.push_back(i + 1);
        }
    }
    return result;
}

void printUsage(int argc, char** argv) {
    printf("ldd by techhog\n"
        "usage: %s inputfile [options]\n"
        "options:\n"
        "  -s  - don't log. use twice to disable code analysis output (fail silently)\n",
        argc ? argv[0] : "ldd"
    );
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printUsage(argc, argv);
        puts("\nwhy you're here: no arguments");
        return 1;
    }

    int logging = 2;
    int file_argc = 0;

    for (int i = 1; i < argc; i++) {
        const char* arg = argv[i];
        if (arg[0] && arg[0] == '-') {
            if (arg[1] && arg[1] == 's')
                logging--;
            else {
                fprintf(stderr, "[ERROR]: invalid arg %s; run with no arguments for help (run %s)\n", arg, argv[0]);
                return 1;
            }
        } else file_argc = i;
    }

    if (!file_argc) {
        printUsage(argc, argv);
        puts("\nwhy you're here: no input file");
        return 1;
    }

    #define LOGERR (logging > 0)
    #define LOG (logging > 1)

    const char* file_path = argv[1];

    std::ifstream file(file_path);
    if (!file) {
        fprintf(stderr, "[ERROR]: failed to open %s\n", file_path);
        return 1;
    }
    if (LOG)
        printf("[log] opened file %s\n", file_path);

    std::string contents;
    std::string buffer;
    while (std::getline(file, buffer))
        contents.append(buffer) += '\n';

    file.close();

    if (LOG)
        puts("[log] computing line offsets");

    auto line_offsets = computeLineOffsets(contents);

    if (LOG)
        printf("[log] read file (%zu bytes)\n", contents.size());

    Allocator allocator;
    AstNameTable name_table(allocator);

    ParseOptions options;
    options.captureComments = true;
    options.noErrorLimit = true;

    if (LOG)
        puts("[log] parsing...");

    ParseResult result = Parser::parse(contents.c_str(), contents.size(), name_table, allocator, options);
    auto& errors = result.errors;
    if (!errors.empty()) {
        if (!LOGERR)
            return 1;

        auto error_count = errors.size();
        fprintf(stderr, "[ERROR]: there were %zu parse errors:\n", error_count);
        for (const auto& error : errors) {
            auto location = error.getLocation();

            fprintf(stderr, "  %d:%d - %d:%d", location.begin.line, location.begin.column, location.end.line, location.end.column);
            fprintf(stderr, " - %s\n", error.getMessage().c_str());
        }

        return 1;
    }

    if (LOG)
        puts("[log] parsed & valid input");

    Visitor visitor(&result, contents, &line_offsets);
    result.root->visit(&visitor);

    if (LOG)
        puts("[log] visited. assigning scores ...");

    // declare all
    #define X(name) int score_##name = 0;
    DECOMPILERS(X)
    #undef X

    #define DECREMENT(name) score_##name--;
    #define DECREMENT_ALL DECOMPILERS(DECREMENT)
    #define ONLY(name) { DECREMENT_ALL score_##name += 2; }
    #define ONLY2(name1, name2) { DECREMENT_ALL score_##name1 += 2; score_##name2 += 2; }
    #define BIG2() ONLY2(oracle, luaexpert)
    #define UNEXPECTED_DUO() ONLY2(oracle, medal)
    #define UNDERDOGS() ONLY2(luaexpert, medal)

    if (LOG) {
        puts("[log] flags:");

        #define SHOWFLAG(flag) printf("  flag " #flag ": %s\n", visitor.flag_##flag ? "true" : "false");
        SHOWFLAG(ifexpr)
        SHOWFLAG(compoundassign)

        SHOWFLAG(var_table)
        SHOWFLAG(var_num)
        SHOWFLAG(var_under)
        SHOWFLAG(var_dunder)
        SHOWFLAG(var_under_num)

        SHOWFLAG(simple_upvalue)
        SHOWFLAG(medal_upvalue)

        SHOWFLAG(func_name_v)
        SHOWFLAG(func_name_f)

        SHOWFLAG(param_under)
        SHOWFLAG(param_dunder)
        SHOWFLAG(param_untouched)

        SHOWFLAG(forvar_medal_upvalue)
        SHOWFLAG(forvar_under)
        SHOWFLAG(forvar_dunder)
        SHOWFLAG(forvar_i)
        SHOWFLAG(forvar_j)
        SHOWFLAG(forvar_k)
        SHOWFLAG(forvar_n)
        SHOWFLAG(forvar_m)
        SHOWFLAG(forvar_i_num)
        SHOWFLAG(forvar_n_num)
        SHOWFLAG(forvar_v_num)

        SHOWFLAG(forinvar_medal_upvalue)
        SHOWFLAG(forinvar_under)
        SHOWFLAG(forinvar_dunder)

        SHOWFLAG(func_no_header)
        SHOWFLAG(func_singleline)
        SHOWFLAG(func_header_block)
        SHOWFLAG(func_header_simple)

        #undef SHOWFLAG
    }

    // adjust scores based on flags

    if (visitor.flag_ifexpr)
        BIG2()
    if (visitor.flag_compoundassign)
        ONLY(oracle)
    // type-specific variable names
    if (visitor.flag_var_table)
        BIG2()
    if (visitor.flag_var_num)
        ONLY(oracle)
    // unused variables
    if (visitor.flag_var_under_num)
        ONLY(luaexpert)
    else if (visitor.flag_var_under)
        UNEXPECTED_DUO()
    else if (visitor.flag_var_dunder)
        ONLY(oracle)
    // upvalues
    if (visitor.flag_simple_upvalue)
        BIG2()
    if (visitor.flag_medal_upvalue)
        ONLY(medal)
    // func name
    if (visitor.flag_func_name_v)
        UNEXPECTED_DUO()
    if (visitor.flag_func_name_f)
        ONLY(luaexpert)
    // parameters
    if (visitor.flag_param_under)
        UNEXPECTED_DUO()
    if (visitor.flag_param_dunder)
        ONLY(oracle)
    if (visitor.flag_param_untouched)
        ONLY(luaexpert)
    // for var
    if (visitor.flag_forvar_medal_upvalue)
        ONLY(medal)
    else if (visitor.flag_forvar_dunder)
        ONLY(oracle)
    else if (visitor.flag_forvar_m)
        ONLY(luaexpert)
    else {
        if (visitor.flag_forvar_under)
            UNEXPECTED_DUO()
        if (visitor.flag_forvar_i)
            BIG2()
        if (visitor.flag_forvar_j)
            BIG2()
        if (visitor.flag_forvar_k)
            BIG2()
        if (visitor.flag_forvar_n)
            BIG2()
        if (visitor.flag_forvar_i_num)
            ONLY(luaexpert)
        if (visitor.flag_forvar_n_num)
            ONLY(oracle)
        if (visitor.flag_forvar_v_num)
            UNEXPECTED_DUO()
    }
    if (visitor.flag_forinvar_medal_upvalue)
        ONLY(medal)
    else if (visitor.flag_forinvar_dunder)
        ONLY(oracle)
    else if (visitor.flag_forinvar_under)
        UNEXPECTED_DUO()
    if (visitor.flag_func_singleline)
        UNDERDOGS()
    if (visitor.flag_func_no_header)
        ONLY(medal)
    if (visitor.flag_func_header_block)
        ONLY(luaexpert)
    if (visitor.flag_func_header_simple)
        ONLY(oracle)

    #undef UNDERDOGS
    #undef UNEXPECTED_DUO
    #undef BIG2
    #undef ONLY2
    #undef ONLY
    #undef DECREMENT_ALL
    #undef DECREMENT

    // ensure at least one score is above 0
    #define X(name) score_##name ||
    if (!(DECOMPILERS(X) false)) {
    #undef X
        if (LOGERR)
            puts("[ERROR]: failed to detect any decompiler");
        return 1;
    }

    // build array of scores
    std::array<int, DECOMPCOUNT> scores {
        #define X(name) score_##name,
        DECOMPILERS(X)
        #undef X
    };

    if (LOG) {
        puts("[log] scores:");
        #define X(name) printf("  %s = %d\n", #name, score_##name);
        DECOMPILERS(X)
        #undef X
    }

    std::sort(scores.begin(), scores.end());

    auto best = scores.end() - 1;
    auto second_best = scores.end() - 2;

    // detect ties
    if (*best == *second_best) {
        if (LOGERR) {
            #define MSGSIZE 100

            int i = 0;
            char message[MSGSIZE];
            memset(message, 0, MSGSIZE);

            #define X(name) if (*best == score_##name) \
                i += snprintf(message + i, MSGSIZE - i, "%s", #name ", ");
            DECOMPILERS(X)
            #undef X

            message[i - 2] = 0; // remove trailing comma and onward

            printf("[ERROR]: there was a tie between %s\n", message);

            #undef MSGSIZE
        }
        return 1;
    }

    // determine name from score
    const char* best_name = "unknown";
    #define X(name) if (*best == score_##name) best_name = #name; else
    DECOMPILERS(X) ; // important semi-colon
    #undef X

    if (LOG)
        printf("detected: ");
    printf("%s\n", best_name);
    if (LOG)
        printf("score: %d\n", *best);

    return 0;
}
