# VIPERBase Xcode Template

## Installation

Copy the `VIPERBase Module.xctemplate` to the Xcode templates folder, in `~/Library/Developer/Xcode/Templates`.

After that, modules can be created using the `New File...` command in Xcode.

![](https://raw.githubusercontent.com/rafaelrsilva/viper-base-ios/assets/template/new-file-section.png)

## Usage

Create a folder for the new module, then add a new file and choose **VIPERBase Module** option in the **Templates** section

![](https://raw.githubusercontent.com/rafaelrsilva/viper-base-ios/assets/template/template-section.png)

### Module Name

Set a name for the module, **without any suffix**. This name will be used to create all file, class and contract names.

The file names follow the format below:

- **ModuleName**Builder.swift
- **ModuleName**Contracts.swift
- **ModuleName**Interactor.swift
- **ModuleName**Presenter.swift
- **ModuleName**Router.swift
- **ModuleName**View.swift
- **ModuleName**View.storyboard (for **Storyboard** UI Type only)
- **ModuleName**View.xib (for **XIB** UI Type only)

The class names follow the format below:

- **ModuleName**Builder
- **ModuleName**Interactor
- **ModuleName**Presenter
- **ModuleName**Router
- **ModuleName**View

The contract names follow the format below:

- **ModuleName**ViewProtocol
- **ModuleName**ViewOutputProtocol
- **ModuleName**InteractorProtocol
- **ModuleName**InteractorOutputProtocol
- **ModuleName**RouterProtocol

### View UI Type

- **Storyboard**: Will be created a storyboard file for designing the UI.
- **XIB**: Will be created a XIB file for designing the UI.
- **None**: No file for designing the UI. Use this if you intent to design the UI programmatically.

For both storyboard and XIB, there is a default view controller component created and configured. No additional setup needed, unless you intent to use other components, like table view controller, collection view controller and others. For this case, you need to connect the respective class and the UI by your own.

## Conclusion

After creating the module, it is expected no errors if you try to rebuild the project.

This readme file covered only the template install and usage. For assistence about implementation, check **VIPERBase** readme file [here](https://github.com/rafaelrsilva/viper-base-ios/blob/2.1.0/README.md).