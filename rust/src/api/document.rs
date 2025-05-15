use std::collections::HashMap;
use flutter_rust_bridge::frb;
pub use tantivy::schema::OwnedValue;
pub use tantivy::schema::Field;
use tantivy::schema::Value;
pub use tantivy as tv;
pub use tantivy::TantivyDocument as tv_doc;
use super::schema::{ Schema};


pub struct Document{
    inner: tv_doc
}

impl Document  {
    #[frb(sync)]
    pub fn new( data: HashMap<String, OwnedValue>, schema: &Schema) -> Result<Document, tv::TantivyError>  {
         let mut doc = tv_doc::new();
        for (field_name, value) in data.iter() {
            let field = schema.get_field(field_name)?;
            let bool_value = value.as_bool();
            if ! bool_value.is_none() {
                 doc.add_bool(field, bool_value.unwrap());
            }
            
            let integer_value = value.as_i64();
            if ! integer_value.is_none() {
                 doc.add_i64(field, integer_value.unwrap());
            }
            let float_value = value.as_f64();
            if ! float_value.is_none() {
                 doc.add_f64(field, float_value.unwrap());
            }
            let text_value = value.as_str();
            if ! text_value.is_none() {
                 doc.add_text(field, text_value.unwrap());
            }
        }
Ok(Document { inner: doc })
    }
    
}