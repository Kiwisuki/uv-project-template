import click


@click.group()
def cli() -> None:
    """Application Command Line Interface."""


@cli.command()
def main() -> None:
    """An example command that prints a message."""
    click.echo("This is an example command from uv_app.")


if __name__ == "__main__":
    cli()
