--  filter index words in the HTML version
local function isempty(s)
  return s == nil or s == ''
end

return {
  {
    Str = function (elem)
      a,b,text = string.find(elem.text,"(%b+|)")
      if isempty(a) then
        -- we did not find a pattern
        return elem
      else
        elem.text = string.gsub(string.sub(text,2,-2),"_"," ")
        return  elem 
      end
    end,
  }
}