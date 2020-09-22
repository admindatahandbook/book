-- test filter
return {
  {
    Str = function (elem)
      if string.sub(elem.text,1,2) == "||"  then
        if string.sub(elem.text,-2) == "||" then
            elem.text = string.sub(elem.text,3,-3)
        elseif string.match(string.sub(elem.text,-3),"||[%p]") then
            elem.text = string.sub(elem.text,3,-4) .. string.sub(elem.text,-1)
        end
        return pandoc.Strong { elem }
      else
        return elem
      end
    end,
  }
}