module ClientDate
  def format_date(date)
    return "" if date.nil?
    assemble_javascript(date,"fd")
  end
  
  def format_datetime(date,seconds=false)
    return "" if date.nil?
    function = seconds ? "fdts" : "fdt"
    assemble_javascript(date,function)
  end
  
  private
  
    def date_params(date)
      return "" if date.nil?
      text  = date.year.to_s + ","
      text += date.month.to_s + ","
      text += date.day.to_s + ","
      text += date.hour.to_s + ","
      text += date.min.to_s + ","
      text += date.sec.to_s
      text
    end
  
    def assemble_javascript(date,function)
      "<script>"+function+"("+date_params(date)+");</script>"
    end
end