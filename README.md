# About

`fiquill` is a [Typst](https://typst.app/home/) template for thesis typesetting on the Faculty of Informatics.

# Requirements
Currently, the template is built for `typst:0.13.1`.
If you want to use the template as is, you would need [Garamond fonts](https://github.com/octaviopardo/EBGaramond12), including the [math font](https://github.com/YuanshengZhao/Garamond-Math).

# Usage
Currently, you can use `fiquill` either in [the online editor](https://typst.app/), or locally. While the editor is quite feature rich, it is recommended to use `fiquill` locally, as the package is currently designed for that.

## In the online editor
1. Create a new project.
2. Download and extract the distribution package archive (**NOT** the source code archive) from releases.
3. Upload the contents of the `{version}` folder in the distribution package into a separate folder in the editor.
4. (if you use them) upload fonts to your project, the location does not matter.
5. In your new typst file, use `#import "./{template-folder}/src/lib.typ": *`
6. You are now ready to use the template.

### Updating
If you want to update the template in the online editor, replace the contents of your template folder with the new distribution.

## Locally
Best way to use Typst locally is in VSCode with the [Tinymist Typst](https://marketplace.visualstudio.com/items/?itemName=myriad-dreamin.tinymist) extenstion. You don't need to download the Typst compiler separately, as it is included in the extension.

1. Find or create your local data directory. You can follow [this official guide](https://github.com/typst/packages?tab=readme-ov-file#local-packages).
2. Create a new local `fiquill` package in the directory.
3. Download the distribution package archive (**NOT** the source code archive) from releases.
4. Extract the downloaded package into the newly created folder.
5. You can now `#import "@local/fiquill:{version}": *` anywhere.
6. (if you use them) install the fonts on your system. Alternatively, you can specify the font path through CLI arguments or extension settings.

### Updating
If you want to update the package to a new version, simply extract the new distribution package archive into the `fiquill` folder in your data directory.

# Reporting issues and suggestions
If you have an issue with `fiquill` or want to suggest a new feature, please create a new GitLab issue for it. When creating a new issue, please follow the template for it.