module ApplicationHelper
  def link_to_add_fields(name, model_form, association, **kwargs)
    new_object = model_form.object.send(association).klass.new
    id = new_object.object_id
    fields = model_form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", form: builder)
    end

    if kwargs.include?(:class)
      kwargs[:class] += ' add_fields'
    else
      kwargs[:class] = 'add_fields'
    end
    
    link_to(name, '#', data: {id: id, fields: fields.gsub("\n", "")}, **kwargs)
  end
end
