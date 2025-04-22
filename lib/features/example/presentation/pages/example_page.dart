// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_movie/core/di/injection.dart';
// import 'package:flutter_movie/features/example/presentation/bloc/example_bloc.dart';
// import 'package:flutter_movie/features/example/presentation/widgets/example_list_item.dart';
//
// class ExamplePage extends StatelessWidget {
//   const ExamplePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) =>
//           getIt<ExampleBloc>()..add(const ExampleEvent.loadExamples()),
//       child: Builder(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: const Text('Examples'),
//           ),
//           body: BlocBuilder<ExampleBloc, ExampleState>(
//             builder: (context, state) {
//               return state.when(
//                 initial: () => const SizedBox(),
//                 loading: () => const Center(child: CircularProgressIndicator()),
//                 loaded: (examples) => ListView.builder(
//                   itemCount: examples.length,
//                   itemBuilder: (context, index) => ExampleListItem(
//                     example: examples[index],
//                   ),
//                 ),
//                 error: (message) => Center(
//                   child: Text(
//                     'Error: $message',
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                 ),
//               );
//             },
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () => context
//                 .read<ExampleBloc>()
//                 .add(const ExampleEvent.loadExamples()),
//             child: const Icon(Icons.refresh),
//           ),
//         ),
//       ),
//     );
//   }
// }
