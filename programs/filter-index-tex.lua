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
        -- text = before .. string.gsub(string.sub(text,2,-2),"_"," ") .. after
        text = string.gsub(string.sub(text,2,-2),"_"," ")
        elem.text = text
	      return {
          pandoc.Str(before),
          elem,
          pandoc.RawInline('latex','\\index{') ,
          elem,
          pandoc.RawInline('latex','}') ,
          pandoc.Str(after)
        }
      end
    end,
  }
}
