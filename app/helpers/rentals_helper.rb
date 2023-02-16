module RentalsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_rentals_path
    elsif action_name == 'edit'
      rental_path
    end
  end
end