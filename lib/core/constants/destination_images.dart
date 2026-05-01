const destinationImages = <int, String>{
  1: 'https://images.unsplash.com/photo-1596422846543-75c6fc18a594?auto=format&fit=crop&q=80&w=800',
  2: 'https://images.unsplash.com/photo-1590603740183-980e7f6920eb?auto=format&fit=crop&q=80&w=800',
  3: 'https://images.unsplash.com/photo-1623940173693-0182697850a5?auto=format&fit=crop&q=80&w=800',
  4: 'https://images.unsplash.com/photo-1610444583737-14e3650f9686?auto=format&fit=crop&q=80&w=800',
  5: 'https://images.unsplash.com/photo-1534265535-3db4ad5026d7?auto=format&fit=crop&q=80&w=800',
  6: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&q=80&w=800',
  7: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&q=80&w=800',
  8: 'https://images.unsplash.com/photo-1518495973542-4542c06a5843?auto=format&fit=crop&q=80&w=800',
};

const _fallback =
    'https://images.unsplash.com/photo-1596422846543-75c6fc18a594?auto=format&fit=crop&q=80&w=800';

String destinationImageUrl(int id, {bool large = false, String? dbImageUrl}) {
  final base = dbImageUrl ?? destinationImages[id] ?? _fallback;
  if (!large) return base;
  if (base.contains('w=')) {
    return base.replaceFirst(RegExp(r'w=\d+'), 'w=1200');
  }
  return base.contains('?') ? '$base&w=1200' : '$base?w=1200';
}
