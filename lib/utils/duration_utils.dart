import '../l10n/app_localizations.dart';

extension DurationUtils on Duration {
  String toRelativeInDays(AppLocalizations l10n) => switch (this) {
    Duration(inDays: 0) => l10n.today,
    Duration(inDays: 1) => l10n.tomorrow,
    Duration(inDays: -1) => l10n.yesterday,
    Duration(inDays: final days, isNegative: true) => l10n.daysAgo(-days),
    Duration(inDays: final days) => l10n.daysFromNow(days),
  };
}
