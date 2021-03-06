module RegistrationsHelper
  def sold_out_or_register?(event)
    if event.sold_out?
      content_tag(:span, 'Sold Out!', class: 'sold-out')
    else
      link_to 'Register!', new_event_registration_path(event),
              class: 'register'
    end
  end
end
