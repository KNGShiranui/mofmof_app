module RentalsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
    # action_name == 'confirm'も必要なのはバリデーションにひっかかって突き返された後の再投稿におけるアクション名がconfirmだから。
    # confirmがないとエラーになる
      confirm_rentals_path
    elsif action_name == 'edit' || action_name == 'update'
    # action_name == 'update'も必要なのはバリデーションにひっかかって突き返された後の再投稿におけるアクション名がupdateだから。
    # updateがないとエラーになる
      rental_path
    end
  end
end