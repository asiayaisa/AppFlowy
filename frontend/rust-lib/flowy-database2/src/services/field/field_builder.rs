use crate::entities::FieldType;
use crate::services::field::default_type_option_data_from_type;
use collab_database::database::gen_field_id;
use collab_database::fields::{Field, TypeOptionData};

pub struct FieldBuilder {
  field: Field,
}

impl FieldBuilder {
  pub fn new<T: Into<TypeOptionData>>(field_type: FieldType, type_option_data: T) -> Self {
    let mut field = Field::new(gen_field_id(), "".to_string(), field_type.into(), false);
    field
      .type_options
      .insert(field_type.to_string(), type_option_data.into());
    Self { field }
  }

  pub fn from_field_type(field_type: FieldType) -> Self {
    let type_option_data = default_type_option_data_from_type(field_type);
    Self::new(field_type, type_option_data)
  }

  pub fn name(mut self, name: &str) -> Self {
    name.clone_into(&mut self.field.name);
    self
  }

  pub fn primary(mut self, is_primary: bool) -> Self {
    self.field.is_primary = is_primary;
    self
  }

  pub fn build(self) -> Field {
    self.field
  }
}
