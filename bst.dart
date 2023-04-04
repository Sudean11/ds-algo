main() {
  BinaryTree? root = null;
  root = insertValueInBinaryTree(root, 5);
  insertValueInBinaryTree(root, 2);
  insertValueInBinaryTree(root, 3);
  insertValueInBinaryTree(root, 55);
  insertValueInBinaryTree(root, 6);
  insertValueInBinaryTree(root, 1);
  insertValueInBinaryTree(root, 22);
  insertValueInBinaryTree(root, 7);
  insertValueInBinaryTree(root, 0);
  insertValueInBinaryTree(root, 9);

  print(searchValueInNode(root, 7));
}

searchValueInNode(BinaryTree? root, int i) {
  // print(root?.value);
  if (root?.value == i) {
    return true;
  }
  if (root == null) {
    return false;
  }

  if (root.value > i) {
    print("left node");
    return searchValueInNode(root.leftNode, i);
  } else {
    print("right node");
    return searchValueInNode(root.rightNode, i);
  }
}

insertValueInBinaryTree(BinaryTree? rootNode, int value) {
  if (rootNode == null) {
    print(value);
    return BinaryTree(value: value);
  }

  if (rootNode.value > value) {
    print("left node");
    if (rootNode.leftNode == null) {
      rootNode.leftNode = insertValueInBinaryTree(rootNode.leftNode, value);
    } else {
      insertValueInBinaryTree(rootNode.leftNode, value);
    }
  } else {
    print("right node");
    if (rootNode.rightNode == null) {
      rootNode.rightNode = insertValueInBinaryTree(rootNode.rightNode, value);
    } else {
      insertValueInBinaryTree(rootNode.rightNode, value);
    }
  }
}

class BinaryTree {
  int value;
  BinaryTree? leftNode;
  BinaryTree? rightNode;

  BinaryTree({
    required this.value,
  });
}
