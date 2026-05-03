const destinationImages = <int, String>{
  // Cox's Bazar - tropical beach
  1: 'https://images.unsplash.com/photo-1559128010-7c1ad6e1b6a5?auto=format&fit=crop&q=80&w=800',
  // Sajek Valley - mountain/clouds
  2: 'https://images.unsplash.com/photo-1590603740183-980e7f6920eb?auto=format&fit=crop&q=80&w=800',
  // Sylhet Tea Gardens - tea rows
  3: 'https://images.unsplash.com/photo-1564507592333-c60657eea523?auto=format&fit=crop&q=80&w=800',
  // Saint Martin's Island - coral/sea
  4: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&q=80&w=800',
  // Bandarban - mountain/hills
  5: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?auto=format&fit=crop&q=80&w=800',
  // Kuakata - beach
  6: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&q=80&w=800',
  // Rangamati Lake - lake/nature
  7: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&q=80&w=800',
  // Sundarbans - forest/nature
  8: 'https://images.unsplash.com/photo-1518495973542-4542c06a5843?auto=format&fit=crop&q=80&w=800',
};

const _fallback =
    'https://images.unsplash.com/photo-1559128010-7c1ad6e1b6a5?auto=format&fit=crop&q=80&w=800';

String destinationImageUrl(int id, {bool large = false, String? dbImageUrl}) {
  final base = dbImageUrl ?? destinationImages[id] ?? _fallback;
  if (!large) return base;
  if (base.contains('w=')) {
    return base.replaceFirst(RegExp(r'w=\d+'), 'w=1200');
  }
  return base.contains('?') ? '$base&w=1200' : '$base?w=1200';
}
