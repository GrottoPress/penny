struct CurrentUser::BearerLogins::NewPage < MainLayout
  needs operation : CreateBearerLogin

  include PageParamKey

  def page_title
    Rex.t(:"page.current_user.bearer_login.new.page_title")
  end

  def content
    h1 Rex.t(:"page.current_user.bearer_login.new.main_title")

    form_for Create do
      para do
        mount Shared::Field, operation.name
      end

      para do
        label_for operation.scopes,
          Rex.t(:"page.current_user.bearer_login.new.form.scopes.label")

        multi_select_input(operation.scopes) do
          options_for_select(operation.scopes, options_for_scopes)
        end

        mount Shared::FieldErrors, operation.scopes
      end

      # para do
      #   mount Shared::Field, operation.scopes do |builder|
      #     builder.multi_select_input do
      #       builder.options_for_select(select_options: options_for_scopes)
      #     end
      #   end
      # end

      para do
        button Rex.t(:"page.current_user.bearer_login.new.form.submit.label"),
          role: "submit"
      end
    end

    para do
      link "[=] #{list_text}", to: Index
    end
  end

  private def options_for_scopes
    BearerScope.action_scopes.map { |scope| {scope.to_s, scope.to_s} }
  end
end
