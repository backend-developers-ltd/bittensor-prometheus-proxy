from django.core.management import BaseCommand

from project.core.models import Validator


class Command(BaseCommand):
    """For local development, run this command to whitelist a hotkey without the need to register it in any subnet."""
    def add_arguments(self, parser):
        parser.add_argument(
            "validator_public_key", type=str, help="public key of the validator to be inserted"
        )

    def handle(self, *args, **options):
        Validator.objects.create(
            public_key=options["validator_public_key"],
            active=True,
            debug=True,
        )
