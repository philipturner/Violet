import Foundation
import FileSystem
import VioletCore
import VioletObjects

class FakeFileSystem: PyFileSystem {

  var currentWorkingDirectory = Path(string: "cwd")

  func open(_ py: Py, fd: Int32, mode: FileMode) -> PyResultGen<FileDescriptorType> {
    shouldNotBeCalled()
  }

  func open(_ py: Py, path: Path, mode: FileMode) -> PyResultGen<FileDescriptorType> {
    shouldNotBeCalled()
  }

  func stat(_ py: Py, fd: Int32) -> PyFileSystemStatResult {
    shouldNotBeCalled()
  }

  func stat(_ py: Py, path: Path) -> PyFileSystemStatResult {
    shouldNotBeCalled()
  }

  func readdir(_ py: Py, fd: Int32) -> PyFileSystemReaddirResult {
    shouldNotBeCalled()
  }

  func readdir(_ py: Py, path: Path) -> PyFileSystemReaddirResult {
    shouldNotBeCalled()
  }

  func read(_ py: Py, fd: Int32) -> PyResultGen<Data> {
    shouldNotBeCalled()
  }

  func read(_ py: Py, path: Path) -> PyResultGen<Data> {
    shouldNotBeCalled()
  }

  func basename(path: Path) -> Filename {
    shouldNotBeCalled()
  }

  func dirname(path: Path) -> FileSystem.DirnameResult {
    shouldNotBeCalled()
  }

  func join(path: Path, element: PathPartConvertible) -> Path {
    shouldNotBeCalled()
  }

  func join<T: PathPartConvertible>(path: Path, elements: T...) -> Path {
    shouldNotBeCalled()
  }

  func join<T: PathPartConvertible>(path: Path, elements: [T]) -> Path {
    shouldNotBeCalled()
  }
}
