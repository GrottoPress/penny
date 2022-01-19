class Shared::FieldErrors(T) < BaseComponent
  needs attribute : Avram::Attribute(T) #Avram::PermittedAttribute(T)

  # Customize the markup and styles to match your application
  def render
    unless attribute.valid?
      span class: "error" do
        text attribute.errors.first
      end
    end
  end
end
