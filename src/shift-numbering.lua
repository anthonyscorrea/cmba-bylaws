-- Based on https://github.com/jgm/pandoc/issues/5071#issuecomment-856918980
-- For LaTeX documents, shift all headings down by one.
-- Make Level 1 unnumbered, or remove it if it contains the "hidden" class. (`# Title {.hidden}`)
function Header(el)
        if el.level == 1 then
            --check for hidden class. (Why didn't pandoc make this a set? `{class_name = true}`)
            for i, v in ipairs(el.classes) do
                if v == "hidden" then
                    --The empty list means remove the element
                    return {}
                end
            end
            -- this may mean that there are two unnumbered classes, but that doesn't matter.
            el.classes[#el.classes + 1] = "unnumbered"
        else
            -- all headings > 1 are shifted down so that you don't end up with 0.x.y headings.
            el.level = el.level - 1
        end
    return el
end