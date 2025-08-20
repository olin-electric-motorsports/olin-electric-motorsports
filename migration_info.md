## Migration of `bom_join_deps`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository bom_join_deps instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:129:12: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip.bzl:98:19: in pip_install
Repository rule pip_repository defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip_install/pip_repository.bzl:362:33: in <toplevel>

```

#### Definition
```python
load("@@rules_python//python/pip_install:pip_repository.bzl", "pip_repository")
pip_repository(
  name = "bom_join_deps",
  requirements = "//tools/symbols:requirements.txt",
  repo_prefix = "pypi__",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced using a module extension:

## Migration of `rules_cc`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository rules_cc instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:45:22: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/io_bazel_rules_go/go/private/repositories.bzl:111:11: in go_rules_dependencies
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/io_bazel_rules_go/go/private/repositories.bzl:279:18: in _maybe
Repository rule http_archive defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_tools/tools/build_defs/repo/http.bzl:382:31: in <toplevel>

```

#### Definition
```python
load("@@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
  name = "rules_cc",
  urls = [
    "https://mirror.bazel.build/github.com/bazelbuild/rules_cc/archive/02becfef8bc97bda4f9bb64e153f1b0671aec4ba.zip",
    "https://github.com/bazelbuild/rules_cc/archive/02becfef8bc97bda4f9bb64e153f1b0671aec4ba.zip"
  ],
  sha256 = "fa42eade3cad9190c2a6286a6213f07f1a83d26d9f082d56f526d014c6ea7444",
  strip_prefix = "rules_cc-02becfef8bc97bda4f9bb64e153f1b0671aec4ba",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
Found perfect name match in BCR: `rules_cc`

It has been introduced as a Bazel module:

	bazel_dep(name = "rules_cc", version = "0.2.0")
## Migration of `symbol_library_converter_deps`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository symbol_library_converter_deps instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:124:12: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip.bzl:98:19: in pip_install
Repository rule pip_repository defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip_install/pip_repository.bzl:362:33: in <toplevel>

```

#### Definition
```python
load("@@rules_python//python/pip_install:pip_repository.bzl", "pip_repository")
pip_repository(
  name = "symbol_library_converter_deps",
  requirements = "//tools/symbols:requirements.txt",
  repo_prefix = "pypi__",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced using a module extension:

## Migration of `rules_python`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository rules_python instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:13:13: in <toplevel>
Repository rule http_archive defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_tools/tools/build_defs/repo/http.bzl:382:31: in <toplevel>

```

#### Definition
```python
load("@@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
  name = "rules_python",
  url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.10.0.tar.gz",
  sha256 = "56dc7569e5dd149e576941bdb67a57e19cd2a7a63cc352b62ac047732008d7e1",
  strip_prefix = "rules_python-0.10.0",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
Found perfect name match in BCR: `rules_python`

Found partially name matches in BCR: `rules_python_gazelle_plugin`

It has been introduced as a Bazel module:

	bazel_dep(name = "rules_python", version = "1.5.3")
## Migration of `pydeps`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository pydeps instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:119:12: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip.bzl:98:19: in pip_install
Repository rule pip_repository defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip_install/pip_repository.bzl:362:33: in <toplevel>

```

#### Definition
```python
load("@@rules_python//python/pip_install:pip_repository.bzl", "pip_repository")
pip_repository(
  name = "pydeps",
  requirements = "//third_party:requirements.txt",
  repo_prefix = "pypi__",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced using a module extension:

## Migration of `pytest_deps`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository pytest_deps instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:114:12: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip.bzl:98:19: in pip_install
Repository rule pip_repository defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip_install/pip_repository.bzl:362:33: in <toplevel>

```

#### Definition
```python
load("@@rules_python//python/pip_install:pip_repository.bzl", "pip_repository")
pip_repository(
  name = "pytest_deps",
  requirements = "//tools/pytest:requirements.txt",
  repo_prefix = "pypi__",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced using a module extension:

## Migration of `hedron_compile_commands`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository hedron_compile_commands instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:134:13: in <toplevel>
Repository rule http_archive defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_tools/tools/build_defs/repo/http.bzl:382:31: in <toplevel>

```

#### Definition
```python
load("@@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
  name = "hedron_compile_commands",
  url = "https://github.com/hedronvision/bazel-compile-commands-extractor/archive/140666077ab4ca7f10041080e8b55cf641c07d30.tar.gz",
  sha256 = "ce5714be202e942ba5f404d1c373a2fbb4b88c66737a924491fbd49afa91d48b",
  strip_prefix = "bazel-compile-commands-extractor-140666077ab4ca7f10041080e8b55cf641c07d30",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced with `use_repo_rule`:

## Migration of `cantools_deps`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository cantools_deps instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:109:12: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip.bzl:98:19: in pip_install
Repository rule pip_repository defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/rules_python/python/pip_install/pip_repository.bzl:362:33: in <toplevel>

```

#### Definition
```python
load("@@rules_python//python/pip_install:pip_repository.bzl", "pip_repository")
pip_repository(
  name = "cantools_deps",
  requirements = "@@cantools_//:requirements.txt",
  repo_prefix = "pypi__",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced using a module extension:

## Migration of `com_github_bazelbuild_buildtools`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository com_github_bazelbuild_buildtools instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:60:21: in <toplevel>
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_gazelle/deps.bzl:98:11: in gazelle_dependencies
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_gazelle/deps.bzl:156:18: in _maybe
Repository rule go_repository defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_gazelle/internal/go_repository.bzl:194:32: in <toplevel>

```

#### Definition
```python
load("@@bazel_gazelle//internal:go_repository.bzl", "go_repository")
go_repository(
  name = "com_github_bazelbuild_buildtools",
  importpath = "github.com/bazelbuild/buildtools",
  version = "v0.0.0-20200718160251-b1667ff58f71",
  sum = "h1:Et1IIXrXwhpDvR5wH9REPEZ0sUtzUoJSq19nfmBqzBY=",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
	It is not found in BCR. 

	It has been introduced using a module extension:

## Migration of `bazel_gazelle`:

<details>
<summary>Click here to see where and how the repo was declared in the WORKSPACE file</summary>

#### Location
```python
Repository bazel_gazelle instantiated at:
  /home/jlikins/Documents/olin-electric-motorsports/WORKSPACE:49:13: in <toplevel>
Repository rule http_archive defined at:
  /home/jlikins/.cache/bazel/_bazel_jlikins/9e3020ea2a545f3b7aa32c61f3abb589/external/bazel_tools/tools/build_defs/repo/http.bzl:382:31: in <toplevel>

```

#### Definition
```python
load("@@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
  name = "bazel_gazelle",
  urls = [
    "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz"
  ],
  sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
)
```
**Tip**: URLs usually show which version was used.
</details>

___
Found partially name matches in BCR: `gazelle`

It has been introduced as a Bazel module:

	bazel_dep(name = "gazelle", version = "0.45.0", repo_name = "bazel_gazelle")
