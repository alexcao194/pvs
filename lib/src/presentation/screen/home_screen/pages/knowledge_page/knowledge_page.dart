import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class KnowLedgePage extends StatelessWidget {
  const KnowLedgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TeXView(
      child: TeXViewDocument(
        r'''Cho $$X(z) = \frac{1}{(z-1)^2(z-\frac{1}{2})}$$\nVới $$|z|>1$$ Tìm $$x(n)=IZT\{X(z)\}$$\nTừ công thức $$X(z)$$ đã cho, ta thấy mẫu số của $$X(z)$$có <blank/>. <endline/>\nKhi đó, $$X(z)$$ có thể phân tích thành <blank/> với các hệ số: <endline/>\n<blank/> được xác định bởi <blank/> bằng <blank/> <endline/>\n<blank/> được xác định bởi <blank/> bằng <blank/> <endline/>\n<blank/> được xác định bởi <blank/> bằng <blank/> <endline/>\nVới thành phần <blank/> ta có biến đổi Z ngược bằng <blank/> <endline/>\nVới thành phần <blank/> ta có biến đổi Z ngược bằng <blank/> <endline/>\nVới thành phần <blank/> ta có biến đổi Z ngược bằng <blank/> <endline/>\nKết quả cuối cùng $$x(n)=$$\nCho 123$$X(z) = \frac{1}{(z-1)^2(z-\frac{1}{2})}$$\nVới $$|z|>1$$\nTìm $$x(n)=IZT\{X(z)\}$$\nTừ công thức $$ X(z) $$đã cho, ta thấy mẫu số của $$X(z)$$ có <blank/>. <endline/>\nKhi đó, $$X(z)$$có thể phân tích thành <blank/> với các hệ số:\n<blank/> được xác định bởi  bằng\n<blank/> được xác định bởi  bằng\n<blank/> được xác định bởi <blank/> bằng\nVới thành phần <blank/> ta có biến đổi Z ngược bằng\nVới thành phần <blank/> ta có biến đổi Z ngược bằng\nVới thành phần <blank/> ta có biến đổi Z ngược bằng\nKết quả cuối cùng $$x(n)=$$'''
      ),
    );
  }
}
