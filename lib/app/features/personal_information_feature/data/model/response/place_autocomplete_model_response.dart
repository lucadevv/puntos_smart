class PlaceAutocompleteModelResponse {
  final List<PredictionModelResponse> predictions;

  PlaceAutocompleteModelResponse({required this.predictions});

  factory PlaceAutocompleteModelResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteModelResponse(
      predictions: List<PredictionModelResponse>.from(
          json['predictions'].map((x) => PredictionModelResponse.fromJson(x))),
    );
  }
}

class PredictionModelResponse {
  final String description;
  final String placeId;
  final String reference;
  final StructuredFormatting structuredFormatting;
  final List<Term> terms;
  final List<String> types;

  PredictionModelResponse({
    required this.description,
    required this.placeId,
    required this.reference,
    required this.structuredFormatting,
    required this.terms,
    required this.types,
  });

  factory PredictionModelResponse.fromJson(Map<String, dynamic> json) {
    return PredictionModelResponse(
      description: json['description'],
      placeId: json['place_id'],
      reference: json['reference'],
      structuredFormatting:
          StructuredFormatting.fromJson(json['structured_formatting']),
      terms: List<Term>.from(json['terms'].map((x) => Term.fromJson(x))),
      types: List<String>.from(json['types'].map((x) => x)),
    );
  }
}

class StructuredFormatting {
  final String mainText;
  final List<MatchedSubstring> mainTextMatchedSubstrings;

  StructuredFormatting({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'],
      mainTextMatchedSubstrings: List<MatchedSubstring>.from(
          json['main_text_matched_substrings']
              .map((x) => MatchedSubstring.fromJson(x))),
    );
  }
}

class MatchedSubstring {
  final int length;
  final int offset;

  MatchedSubstring({required this.length, required this.offset});

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) {
    return MatchedSubstring(
      length: json['length'],
      offset: json['offset'],
    );
  }
}

class Term {
  final int offset;
  final String value;

  Term({required this.offset, required this.value});

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      offset: json['offset'],
      value: json['value'],
    );
  }
}
