module UsersHelper

def wo_hierachy(workorder)
    items = []
    parent_id = workorder.parent_id
    found = true
    while found == true
        @work = Workorder.where("id=?", parent_id)
        if @work.count > 0
            items << @work.first.name
            parent_id = @work.first.parent_id
        else
            found = false
        end
    end
    return items
end

end    