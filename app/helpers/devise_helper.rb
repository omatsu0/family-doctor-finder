module DeviseHelper
  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    resource.errors.full_messages.each do |error_message|
      html += <<-EOF
      .alert.alert-danger.alert-dismissible{role: "alert"}
        %button.close{"data-dismiss" => "alert", type: "button"}
          %span{"aria-hidden" => "true"}
          %span.sr-only close
        \\#{error_message}
      EOF
    end
    html.html_safe
  end
end