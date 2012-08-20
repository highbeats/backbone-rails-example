module NavogationHelpers
  def path_to(page_name)
    case(page_name)
    when "the_home_page"
      root_path
    end
  end
end
