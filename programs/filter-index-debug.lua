--  filter index words in the LaTeX version
local function isempty(s)
  return s == nil or s == ''
end

return {
  {
    Str = function (elem)
      a,b,before,text,after = string.find(elem.text,"(.*)(%b+|)(.*)")
      if isempty(a) then
        -- we did not find a pattern
        return elem
      else
        text = string.gsub(string.sub(text,2,-2),"_"," ")
	print(text .. ": " ..  pandoc.utils.stringify(before) ..  '\\index{' ..   pandoc.utils.stringify(text) .. '}' ..    pandoc.utils.stringify(after))
	repl_text =  pandoc.utils.stringify(before) ..  '\\index{' ..   pandoc.utils.stringify(text) .. '}' ..    pandoc.utils.stringify(after)
        elem.text = repl_text
	return elem
      end
    end,
  }
}
