module RequestsHelper
  def choose1_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_requests_path
    elsif action_name == 'edit'
      request_path
    end
  end
end
