
use tantivy::schema::Facet as schema_Facet;
use flutter_rust_bridge::frb;

/// A Facet represent a point in a given hierarchy.
///
/// They are typically represented similarly to a filepath. For instance, an
/// e-commerce website could have a Facet for /electronics/tv_and_video/led_tv.
///
/// A document can be associated to any number of facets. The hierarchy
/// implicitely imply that a document belonging to a facet also belongs to the
/// ancestor of its facet. In the example above, /electronics/tv_and_video/
/// and /electronics.

#[derive(Clone)]
pub struct Facet {
    pub(crate) inner: schema_Facet,
}


impl Facet {
    /// Create a new instance of the "root facet" Equivalent to /.
     #[frb(sync)]
    pub fn root() -> Facet {
        Facet {
            inner: schema_Facet::root(),
        }
    }

    /// Returns true if the facet is the root facet /.
    #[frb(sync)]
    pub fn is_root(&self) -> bool {
        self.inner.is_root()
    }

    /// Returns true if another Facet is a subfacet of this facet.
    /// Args:
    ///     other (Facet): The Facet that we should check if this facet is a
    ///         subset of.
    #[frb(sync)]
    pub fn is_prefix_of(&self, other: &Facet) -> bool {
        self.inner.is_prefix_of(&other.inner)
    }


    /// Create a Facet object from a string.
    /// Args:
    ///     facet_string (str): The string that contains a facet.
    ///
    /// Returns the created Facet.
#[frb(sync)]
    pub fn from_string( facet_string: &str) -> Facet {
        Facet {
            inner: schema_Facet::from(&facet_string),
        }    }
    /// Returns the list of `segments` that forms a facet path.
    ///
    /// For instance `//europe/france` becomes `["europe", "france"]`.
    #[frb(sync)]
    pub fn to_path(&self) -> Vec<String> {
        self.inner.to_path().into_iter().map(String::from).collect()
    }

        /// Returns the facet string representation.
    #[frb(sync)]
    pub fn to_path_str(&self) -> String {
        self.inner.to_string()
    }




    }

