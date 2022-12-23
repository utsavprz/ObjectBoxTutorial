import '../data_source/local_data_source/batch_data_source.dart';
import '../model/batch.dart';

abstract class BatchRepository{
  
  Future<List<Batch>> getbatch();
  Future<int> addBatch(Batch batch);

}

class BatchRepositoryImpl extends BatchRepository{
  @override
  Future<int> addBatch(Batch batch) async{

    return BatchDataSource().addBatch(batch);
    
  }

  @override
  Future<List<Batch>> getbatch() async{
    return BatchDataSource().getBatch();
  }

}