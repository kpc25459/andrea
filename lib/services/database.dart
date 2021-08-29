import 'package:andrea/app/home/models/job.dart';
import 'package:andrea/services/api_path.dart';
import 'package:andrea/services/firestore_service.dart';
import 'package:flutter/foundation.dart';

abstract class Database {
  Future<void> createJob(Job job);

  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  final String uid;

  final _service = FirestoreService.instance;

  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> createJob(Job job) => _service.setData(path: APIPath.job(uid, 'job_abc'), data: job.toMap());

  Stream<List<Job>> jobsStream() => _service.collectionStream(path: APIPath.jobs(uid), builder: (data) => Job.fromMap(data));
}
