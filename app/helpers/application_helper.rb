module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = column == sort_column ? "current #{sort_direction}" : nil
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        icon = sort_direction == "asc" ? "fa fa-sort-amount-asc" : "fa fa-sort-amount-desc"
        icon = column == sort_column ? icon : ""
        link_to  link_to "#{title} <span class='#{icon}'></span>".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
      end
end
