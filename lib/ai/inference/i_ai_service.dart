import '../../features/destination/data/models/destination.dart';
import '../../features/destination/data/models/insight.dart';

abstract class IAIService {
  /// Generate a human-friendly summary using a local LLM like Qwen.
  Future<String> summarizeDestination(Destination destination, List<Insight> insights);
  
  /// Create a personalized itinerary based on user constraints.
  Future<String> generateItinerary(Destination destination, int days);
  
  /// Generate vector embeddings for RAG system.
  Future<List<double>> generateEmbeddings(String text);
}
