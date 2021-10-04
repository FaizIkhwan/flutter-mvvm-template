class TestModel {
  String? test;

  TestModel({this.test});

  TestModel.fromJson(Map<String, dynamic> json) {
    test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['test'] = this.test;
    return data;
  }

  @override
  String toString() {
    return 'TestModel{test: $test}';
  }
}
