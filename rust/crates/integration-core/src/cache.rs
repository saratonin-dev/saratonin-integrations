//! In-memory cache with TTL.

use chrono::{DateTime, Utc};
use dashmap::DashMap;
use std::time::Duration;

/// A thread-safe in-memory cache with TTL.
pub struct Cache<V> {
    data: DashMap<String, CacheEntry<V>>,
    ttl: Duration,
}

struct CacheEntry<V> {
    value: V,
    expires_at: DateTime<Utc>,
}

impl<V: Clone> Cache<V> {
    /// Create a new cache with the given TTL.
    pub fn new(ttl: Duration) -> Self {
        Self {
            data: DashMap::new(),
            ttl,
        }
    }

    /// Insert a value into the cache.
    pub fn insert(&self, key: String, value: V) {
        let expires_at = Utc::now() + chrono::Duration::from_std(self.ttl).unwrap();
        self.data.insert(key, CacheEntry { value, expires_at });
    }

    /// Insert a value with a custom TTL.
    pub fn insert_with_ttl(&self, key: String, value: V, ttl: Duration) {
        let expires_at = Utc::now() + chrono::Duration::from_std(ttl).unwrap();
        self.data.insert(key, CacheEntry { value, expires_at });
    }

    /// Get a value from the cache if it exists and hasn't expired.
    pub fn get(&self, key: &String) -> Option<V> {
        self.data.get(key).and_then(|entry| {
            if entry.expires_at > Utc::now() {
                Some(entry.value.clone())
            } else {
                None
            }
        })
    }

    /// Check if a key exists and hasn't expired.
    pub fn contains(&self, key: &String) -> bool {
        self.get(key).is_some()
    }

    /// Remove an entry from the cache.
    pub fn remove(&self, key: &String) -> Option<V> {
        self.data.remove(key).map(|(_, entry)| entry.value)
    }

    /// Clear all entries from the cache.
    pub fn clear(&self) {
        self.data.clear();
    }

    /// Remove expired entries from the cache.
    pub fn cleanup(&self) {
        let now = Utc::now();
        self.data.retain(|_, entry| entry.expires_at > now);
    }

    /// Get the number of entries in the cache (including expired).
    pub fn len(&self) -> usize {
        self.data.len()
    }

    /// Check if the cache is empty.
    pub fn is_empty(&self) -> bool {
        self.data.is_empty()
    }
}

impl<V: Clone> Default for Cache<V> {
    fn default() -> Self {
        Self::new(Duration::from_secs(300)) // 5 minute default TTL
    }
}
