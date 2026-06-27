import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../course/domain/models/course_model.dart';

final dashboardSearchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(() => SearchQueryNotifier());
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';
  void updateQuery(String q) => state = q;
}

final dashboardCategoryProvider = NotifierProvider<CategoryNotifier, String>(() => CategoryNotifier());
class CategoryNotifier extends Notifier<String> {
  @override
  String build() => 'All';
  void updateCategory(String cat) => state = cat;
}

final dashboardCoursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final firestore = FirebaseFirestore.instance;
  final searchQuery = ref.watch(dashboardSearchQueryProvider).toLowerCase();
  final category = ref.watch(dashboardCategoryProvider);

  try {
    Query query = firestore.collection('courses');
    
    if (category != 'All') {
      query = query.where('category', isEqualTo: category);
    }
    
    final snapshot = await query.get();
    
    var courses = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return CourseModel.fromJson(data);
    }).toList();

    if (searchQuery.isNotEmpty) {
      courses = courses.where((c) => c.title.toLowerCase().contains(searchQuery)).toList();
    }

    return courses;
  } catch (e) {
    throw Exception('Failed to load courses: $e');
  }
});
