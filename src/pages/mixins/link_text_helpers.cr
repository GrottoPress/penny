module Mixins::LinkTextHelpers
  macro included
    private def delete_text
      Rex.t(:"page.link.delete")
    end

    private def add_new_text
      Rex.t(:"page.link.add_new")
    end

    private def edit_text
      Rex.t(:"page.link.edit")
    end

    private def list_text
      Rex.t(:"page.link.list")
    end

    private def no_account_text
      Rex.t(:"page.link.no_account?")
    end

    private def have_account_text
      Rex.t(:"page.link.have_account?")
    end

    private def lost_password_text
      Rex.t(:"page.link.lost_password?")
    end

    private def remembered_password_text
      Rex.t(:"page.link.remembered_password?")
    end

    private def revoke_text
      Rex.t(:"page.link.revoke")
    end

    private def revoke_all_text
      Rex.t(:"page.link.revoke_all")
    end

    private def deactivate_text
      Rex.t(:"page.link.deactivate")
    end

    private def deactivate_all_text
      Rex.t(:"page.link.deactivate_all")
    end

    private def log_out_text
      Rex.t(:"page.link.log_out")
    end

    private def log_out_everywhere_text
      Rex.t(:"page.link.log_out_everywhere")
    end
  end
end
