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
        return {
            pandoc.utils.stringify(before), 
            pandoc.RawInline('latex', '\\index{'), 
            pandoc.utils.stringify(text), 
            pandoc.RawInline('latex', '}'),
            pandoc.utils.stringify(after)
        }
      end
    end,
  }
}