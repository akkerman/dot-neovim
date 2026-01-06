local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Helpers
local function to_kebab_case(str)
  return str
    :gsub("%u", function(c)
      return "-" .. c:lower()
    end)
    :gsub("^-", "")
end

local function capitalize(str)
  return (str:gsub("^%l", string.upper))
end

return {
  s(
    "maketest",
    fmt(
      [[
    const make{Pascal} = require('./{kebab}')

    describe('{kebab}', () => {{
      /** @type {{jest.Mocked<Parameters<make{Pascal}>[0]>}} */
      let deps
      /** @type {{ReturnType<make{Pascal}>}} */
      let {camel}

      beforeAll(() => {{
        deps = {{
          // TODO add dependencies here
        }}
        {camel_ref} = make{Pascal}(deps)
      }})

      beforeEach(() => {{
        jest.clearAllMocks()
      }})

      it.todo('should have tests')
    }})
  ]],
      {
        -- User types one base name (camelCase)
        camel = i(1, "functionUnderTest"),

        -- Derived transformations
        Pascal = f(function(args)
          return capitalize(args[1][1])
        end, { 1 }),

        kebab = f(function(args)
          return to_kebab_case(args[1][1])
        end, { 1 }),
        camel_ref = rep(1),
      }
    )
  ),
  s(
    "makefn",
    fmt(
      [[
    module.exports = make{Pascal}

    /**
     * @param {{{{
     *  
     * }}}} dependencies
     */
    function make{Pascal}({{}}) {{
      return {camel}

      /**
       * @param {{{{
       * }}}} _
       */
      async function {camel_ref}() {{
        // TODO: implement function
      }}
    }}
  ]],
      {
        camel = i(1, "theFunction"),
        Pascal = f(function(args)
          return capitalize(args[1][1])
        end, { 1 }),
        camel_ref = rep(1),
      }
    )
  ),
}
