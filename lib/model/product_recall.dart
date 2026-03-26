class ProductRecall {
  final String picture;
  final DateTime saleStartDate;
  final DateTime saleEndDate;
  final String distributors;
  final String geographicalArea;
  final String reason;
  final String? safetyMeasures;
  final String? additionalInfo;
  final String? actionRequired;
  final String externalLink;

  ProductRecall({
    required this.picture,
    required this.saleStartDate,
    required this.saleEndDate,
    required this.distributors,
    required this.geographicalArea,
    required this.reason,
    required this.safetyMeasures,
    required this.additionalInfo,
    required this.actionRequired,
    required this.externalLink,
  });
}

ProductRecall generateProductRecall() => ProductRecall(
  picture:
      'https://rappel.conso.gouv.fr/image/4e14791a-4eda-4f55-9757-30d032f2c5fe.jpg',
  saleStartDate: DateTime(DateTime.now().year, 1, 1),
  saleEndDate: DateTime(DateTime.now().year, 12, 31),
  geographicalArea: 'France entière',
  distributors:
      'ALDI - AUCHAN - CARREFOUR - CASINO - CORA - INTERMARCHE - LECLERC - LIDL - MONOPRIX - SCHIEVER - SYSTÈME U Ainsi que les réseaux de distribution hors domicile.',
  reason:
      'Ce rappel est mis en œuvre par mesure de précaution afin de protéger les personnes allergiques au lait, absent sur la liste d’ingrédients. Il existe de ce fait un risque pour les personnes allergiques au LAIT.',
  safetyMeasures: null,
  additionalInfo:
      'Les personnes non concernées par cette allergie peuvent consommer ces produits en toute sécurité. La sécurité de nos consommateurs et la qualité de nos produits sont notre priorité absolue.',
  actionRequired:
      'Ne plus consommer\nNe plus utiliser le produit\nRapporter le produit au point de vente\nContacter le service consommateur\nDétruire le produit',
  externalLink: 'https://rappel.conso.gouv.fr/affichettePDF/21242/Interne',
);
