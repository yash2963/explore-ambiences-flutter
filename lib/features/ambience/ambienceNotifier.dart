// import 'package:arvyax/shared/constants/app_constants.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
//
// final ambienceRespositoryProvider = Provider((ref) => AmbienceRepository());
//
// final ambiennceProvider =
//     StateNotifierProvider<AmbienceNotifier, AmbienceState>((ref) {
//       // AmbienceProvider(ref.watch(ambienceRespositoryProvider)),
//       final repository = ref.watch(ambienceRespositoryProvider);
//       return AmbienceNotifier(repository);
//     });
// final filterambienceProvider = Provider((ref) {
//   final state = ref.watch(ambiennceProvider);
//   return state.filtered;
// });
// final selectambienceProvider = Provider<String>((ref) {
//   final state = ref.watch(ambiennceProvider);
//   return state.selectedTag;
// });
//
// final tagProvider = Provider<List<String>>((ref) => AppConstants.ambientTags);
