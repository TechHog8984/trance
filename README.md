# ldd - Lua Decompiler Detector

ldd takes in a decompiled lua script and outputs what decompiler it thinks was used.

NOTE: ldd expects output from a decompiler... if you pass in a script that was not decompiled, it will happily tell you that Oracle or luaexpert was used (garbage in = garbage out)

# LICENSING
ldd uses code from [lute](https://github.com/luau-lang/lute). see [lute_LICENSE.txt](lute_LICENSE.txt)

# OBTAINING
```bash
git clone https://github.com/TechHog8984/ldd.git
```

# BUILDING
```bash
cd ldd
mkdir build && cd build
cmake -B . -S .. -DCMAKE_BUILD_TYPE=Release && cmake --build .
# you will now have an executable named ldd
```

# USAGE
```
ldd by techhog
usage: ./ldd inputfile [options]
options:
  -s  - don't log. use twice to disable code analysis output (fail silently)
```

```bash
techhog$ ./build/ldd examples/a_oracle.luau
[log] opened file examples/a_oracle.luau
[log] computing line offsets
[log] read file (3253 bytes)
[log] parsing...
[log] parsed & valid input
[log] visited. assigning scores ...
[log] flags:
  flag ifexpr: true
  flag compoundassign: false
  flag var_table: true
  flag var_num: true
  flag var_under: true
  flag var_dunder: false
  flag var_under_num: false
  flag simple_upvalue: true
  flag medal_upvalue: false
  flag func_name_v: true
  flag func_name_f: false
  flag param_under: true
  flag param_dunder: false
  flag param_untouched: true
  flag forvar_medal_upvalue: false
  flag forvar_under: true
  flag forvar_dunder: false
  flag forvar_i: true
  flag forvar_j: true
  flag forvar_k: true
  flag forvar_n: true
  flag forvar_m: false
  flag forvar_i_num: false
  flag forvar_n_num: true
  flag forvar_v_num: false
  flag forinvar_medal_upvalue: false
  flag forinvar_under: true
  flag forinvar_dunder: false
  flag func_no_header: false
  flag func_singleline: false
  flag func_header_block: false
  flag func_header_simple: true
[log] scores:
  oracle = 14
  luaexpert = 0
  medal = -6
detected: oracle
score: 14
```

```bash
$ ./build/ldd examples/a_medal.luau -s
medal
```

```bash
$ ./build/ldd examples/a_input.luauc
[ERROR]: there were 77 parse errors:
  0:0 - 0:1 - Expected identifier when parsing expression, got ''
  0:1 - 0:2 - Expected identifier when parsing expression, got ''
  0:2 - 0:3 - Expected identifier when parsing expression, got '*'
  ...
```

# INFORMATION I COLLECTED
DO NOT TREAT THE FOLLOWING AS FACT; I WROTE IT DOWN PURELY TO HELP ME IN MY DEVELOPMENT AND I DID NOT INTENSIVELY FACT CHECK

Note that decompilers can have extensive customizability and unless otherwise stated each fact pertains to the default settings.

When describing a 'format', a lua pattern will be used (a leading ^ and a trailing $ is usually implied).

## [Oracle](https://oracle.mshq.dev/)
* output is very accurate to the compiled bytecode
* extensive customizability so take with a grain of salt
* supports Luau v? - v11, PUC-Rio Lua 4.0 - 5.5 (v2 docs says it only supports 5.1 but I doubt that...), LuaJIT
* can output if expressions and compound assigments if configured (both default to true in Luau, but it will emit them for other versions if so desired)
* variables follow the format \[vtu]%d (I'm not sure whether or not you can find any one of these alone, but I have not encountered them EXCEPT for n which can be a for loop variable)
  * n%d is used when the variable is declared as a number (`local n1 = 40`)
  * t%d is used when the variable is declared as a table (`local t2 = { 1 }`)
  * u%d is used for variables that get used as upvalues (and do NOT already fit any of the above formats)
  * v%d is used in other cases
* function names follow the format follow v%d
* function parameters follow the format p%d (not always starting at 1)
* _ and __ are omitted for unused variables (they seem to be both used randomly (the same choice will be in every use in the same file but I've seen samples with both (idk dude)))
* dynamic table output:
  * empty tables will be on one line (`local t3 = {}`)
  * lists with one item will be on one line with the value surrounded by spaces (`local t2 = { globalfunction() }`)
  * other types of tables span multiple lines and are separated with a comma (except for the last element) and a new line. this includes tables such as { \[2] = 10 } despite having arguably "only one element"
  * examples:
```luau
print({ 1 })
print({ superlongglobalfunctionname1234567890() })
print({
	[2] = 100
})
```
* for loop variables follow the format \[ijkn]%d?
  * i, j, and k are used in that order for each nested loop
  * upon reaching 4 nested loops, variables start using n (when applicable) then n%d
* for step is omitted if it's 1
* function bodies always have a new line even when empty
* function comments look like -- line: %d (newline) -- upvalues: var (copy|ref), ...
* global function definitions look like: function name() ...
* variable renaming:
  * :GetService(str) results become str (the object is irrelevant)
  * var.index results become index if the string is a valid identifier, otherwise fallback to normal variable renaming. duplicates follow index%d
  * :FindFirstChild and :WaitForChild(str) results become str (same rules as above)
  * :Connect results follow the format connection%d?
  * transformations: results of `a:func(var)` become var_2 then var_3 and so on. if var already looks like var_%d (has underscore or maybe just is a result of this process? I'm unsure) then this won't happen
    * NOTE: only works on object:FindFirstChild and object:WaitForChild (maybe other functions exist but they're case sensitive and it has to be a namecall, etc.)
* frequent use of new lines for readability
  * example:
```luau
local v1 = if not foo() then baz else bar

g_var = v1

return v1
```
* usage of `do ... end` to scope variables (I imagine to combat limits)
[^o1]: (Oracle) not a real output (empty functions have a newline)

## [lua.expert](https://lua.expert)
* supports Luau v? - v9, maybe more? (lua 5.1 failed and I'm not gonna test any other)
* outputs if expressions but not compound assigments
* no customizability, yay!
* variables follow the format \[vt]%d?
  * t%d? is used when the variable is declared as a table (`local t = { 1 }`, `local t2 = {}`)
  * v%d is used in other cases
* function names follow the format f%d
* function parameters follow the format p%d (always starting at 1)
* unused variables follow the format _%d? (yes it is an incrementing count for whatever reason)
  * unused function parameters and for loop variables undergo NO change
* dynamic table output (see Oracle)
* for loop variables follow the format \[ikjnm]%d?
  * i, j, k, n, and m are used in that order for each nested loop
  * upon reaching 6 nested loops, variables start using i%d (starting at 2)
* for step is omitted if it's 1
* functions with empty bodies are kept on one line
* function comments look like --\[\[ Line: %d, Upvalues: var (copy|ref), ... ]]
* global function definitions look like: function name() ...
* variable renaming:
  * :GetService(str) results become str (the object is irrelevant)
  * var.index results become index if the string is a valid identifier, otherwise fallback to normal variable renaming. duplicates follow index%d
  * :FindFirstChild and :WaitForChild(str) results become str (same rules as above)
* similar newline usage to oracle but at a lower frequency
* usage of `do ... end` to scope variables, also at a lower frequency than Oracle

## [medal](https://github.com/shrimp-nz/medal)
* outputs are commonly broken and some inputs don't work
* supports PUC-Rio Lua 5.1, Luau v4 - v6
* no customizability, yay!
* variables follow the format v%d
  * variables used as upvalues follow the format v_u_%d
* function names follow the format v%d
* function parameters follow the format p%d
* unused variables and parameters become _
  * unused for loop variables undergo NO change
* dynamic table output (see Oracle)
* for loop variables use the same format as normal variables (including upvalues and unused)
* for step is omitted if it's 1
* functions with empty bodies are kept on one line
* function comments look like (at the top of the body) --upvalues: (copy|ref) v_u_%d, ...
* no variable renaming
* no extra newlines
