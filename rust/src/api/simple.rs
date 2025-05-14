use flutter_rust_bridge::frb;
use tantivy::directory::MmapDirectory;
pub use tantivy::Index;
pub use tantivy::IndexReader;
pub use tantivy::IndexWriter;
pub use tantivy::Result;
pub use tantivy::Opstamp;
pub use tantivy::schema::IndexRecordOption;
pub use tantivy::schema::TextFieldIndexing;
pub use tantivy::schema::{Schema, SchemaBuilder, TextOptions};
pub use tantivy::TantivyDocument;

#[frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[frb(mirror(IndexRecordOption))]
pub enum _IndexRecordOption {
    Basic,
    WithFreqs,
    WithFreqsAndPositions,
}

pub struct MySchemaBuilder {
    schema_builder: SchemaBuilder
}

impl MySchemaBuilder {
    #[frb(sync)]
    pub fn new() -> Self {
        MySchemaBuilder {
            schema_builder: Schema::builder()
        }
    }
    #[frb(sync)]
    pub fn build(self) -> Schema {
        self.schema_builder.build()
    }

    pub fn add_text_field(&mut self, name: &str,stored: bool, index_option: IndexRecordOption, tokenizer_name: &str) {
        let indexing_options = TextFieldIndexing::default().
        set_index_option(index_option).
        set_tokenizer(tokenizer_name).
        set_index_option(index_option);

        let text_options = TextOptions::default().
         set_indexing_options(indexing_options);  

        let text_options = 
        if stored {
            text_options.set_stored()
        }
        else {
            text_options
        };

        self.schema_builder.add_text_field(name,text_options.clone());
    }
    pub fn add_integer_field(&mut self, name: &str,stored: bool,fast:bool,indexed:bool) {
        let numeric_options = tantivy::schema::NumericOptions::default();

        let numeric_options = 
        if stored {
            numeric_options.set_stored()
        }
        else {
            numeric_options
        };

        let numeric_options = 
        if fast {
            numeric_options.set_fast()
        }
        else {
            numeric_options
        };

        let numeric_options = 
        if indexed {
            numeric_options.set_indexed()
        }
        else {
            numeric_options
        };
        self.schema_builder.add_u64_field(name, numeric_options.clone());
    }

    pub fn add_float_field(&mut self, name: &str,stored: bool,fast:bool,indexed:bool) {
        let numeric_options = tantivy::schema::NumericOptions::default();

        let numeric_options = 
        if stored {
            numeric_options.set_stored()
        }
        else {
            numeric_options
        };

        let numeric_options = 
        if fast {
            numeric_options.set_fast()
        }
        else {
            numeric_options
        };

        let numeric_options = 
            if indexed {
                numeric_options.set_indexed()
            }
            else {
                numeric_options
            };
        self.schema_builder.add_f64_field(name, numeric_options.clone());
}

    pub fn add_bool_field(&mut self, name: &str, stored: bool,fast:bool,indexed:bool) {
        let numeric_options = tantivy::schema::NumericOptions::default();

        let numeric_options = 
        if stored {
            numeric_options.set_stored()
        }
        else {
            numeric_options
        };

        let numeric_options = 
        if fast {
            numeric_options.set_fast()
        }
        else {
            numeric_options
        };

        let numeric_options = 
            if indexed {
                numeric_options.set_indexed()
            }
            else {
                numeric_options
            };
        self.schema_builder.add_bool_field(name, numeric_options.clone()); 

        
    }

    pub fn add_facet_field(&mut self, name: &str) {
        self.schema_builder.add_facet_field(name, tantivy::schema::FacetOptions::default());

}

}

#[frb()]
pub struct MyIndex {
    index: tantivy::Index,
}

impl MyIndex {
    #[frb(sync)]
    pub fn new(schema: Schema, path: &str) -> Self {
        let mmap_directory = MmapDirectory::open(path).expect("unable to open mmap directory");
        let index = Index::open_or_create(mmap_directory, schema.clone());
        let index = index.expect("Failed to create index").clone();

        MyIndex {
            index: index,
        }
    }
#[frb(sync)]
    pub fn writer(&self,heap_size: usize,num_threads: usize) -> tantivy::IndexWriter {
        if num_threads == 0
        {
            self.index.writer(heap_size).unwrap()
        }
        else{
         self.index.writer_with_num_threads(num_threads.clone(), heap_size).unwrap()
        }
        
        
    }
#[frb(sync)]
    pub fn reader(&self) -> tantivy::IndexReader {
        self.index.reader().unwrap()
    }
}

#[frb(external)]
impl IndexWriter {
   pub fn add_document(&self, document: TantivyDocument) -> tantivy::Result<Opstamp> {      
    }
}

#[frb(external)]
impl IndexReader {
    pub fn searcher(&self) -> tantivy::Result<tantivy::Searcher> {
    }
}