# Turbine Block Propagation

Một cụm Solana sử dụng cơ chế lan truyền khối nhiều lớp được gọi là Turbine để phát các mẩu giao dịch tới tất cả các nút với số lượng thông báo trùng lặp tối thiểu. Cụm phân chia chính nó thành các tập hợp nhỏ của các nút, được gọi là các vùng lân cận. Mỗi nút chịu trách nhiệm chia sẻ bất kỳ dữ liệu nào mà nó nhận được với các nút khác trong vùng lân cận của nó, cũng như truyền tải dữ liệu tới một nhóm nhỏ các nút trong vùng lân cận khác. Bằng cách này, mỗi nút chỉ phải giao tiếp với một số lượng nhỏ các nút.

Trong vị trí của nó, nút lãnh đạo phân phối các mẩu tin nhỏ giữa các nút trình xác thực trong vùng lân cận đầu tiên (lớp 0). Mỗi trình xác thực chia sẻ dữ liệu của nó trong vùng lân cận của nó, nhưng cũng truyền lại các mẩu tin đó đến một nút trong một số vùng lân cận trong lớp tiếp theo (lớp 1). Mỗi nút lớp-1 chia sẻ dữ liệu của chúng với các đồng nghiệp lân cận của chúng và truyền lại cho các nút ở lớp tiếp theo, v.v., cho đến khi tất cả các nút trong cụm đã nhận được tất cả các mẩu tin nhỏ.

## Neighborhood Assignment - Weighted Selection
Để fanout mặt phẳng dữ liệu hoạt động, toàn bộ cụm phải thống nhất về cách phân chia cụm thành các vùng lân cận. Để đạt được điều này, tất cả các nút trình xác nhận được công nhận (các đồng nghiệp của TVU) được sắp xếp theo tỷ lệ và được lưu trữ trong một danh sách. Sau đó, danh sách này được lập chỉ mục theo những cách khác nhau để tìm ra ranh giới vùng lân cận và truyền lại các đồng nghiệp. Ví dụ: người lãnh đạo sẽ chỉ cần chọn các nút đầu tiên để tạo nên lớp 0. Đây sẽ tự động là những người có cổ phần cao nhất, cho phép các phiếu bầu nặng nhất về với người lãnh đạo trước. Các nút lớp 0 và các nút lớp thấp hơn sử dụng cùng một logic để tìm các nút lân cận và các nút lớp tiếp theo của chúng.

Để giảm khả năng bị tấn công vectơ, mỗi mảnh vụn được truyền qua một cây ngẫu nhiên của các vùng lân cận. Mỗi nút sử dụng cùng một tập hợp các nút đại diện cho cụm. Một cây ngẫu nhiên được tạo từ tập hợp cho mỗi mảnh bằng cách sử dụng một hạt giống được lấy từ id người dẫn đầu, vị trí và chỉ mục cắt nhỏ.

## Layer and Neighborhood Structure

Người dẫn đầu hiện tại thực hiện các chương trình phát sóng ban đầu của nó tới hầu hết các nút `DATA_PLANE_FANOUT`. Nếu lớp 0 này nhỏ hơn số nút trong cụm, thì cơ chế fanout trên mặt phẳng dữ liệu sẽ thêm các lớp bên dưới. Các lớp tiếp theo tuân theo các ràng buộc này để xác định dung lượng lớp: Mỗi vùng lân cận chứa các nút `DATA_PLANE_FANOUT`. Lớp 0 bắt đầu với 1 vùng lân cận với các nút fanout. Số lượng các nút trong mỗi lớp bổ sung tăng lên theo hệ số fanout.

Như đã đề cập ở trên, mỗi nút trong một lớp chỉ phải phát các mảnh vụn của nó tới các vùng lân cận của nó và đến chính xác 1 nút trong một số vùng lân cận lớp tiếp theo, thay vì cho mọi đồng đẳng TVU trong cụm. Một cách tốt để nghĩ về điều này là, lớp 0 bắt đầu với 1 vùng lân cận với các nút fanout, lớp 1 thêm các vùng lân cận fanout, mỗi vùng có các nút fanout và lớp 2 sẽ có fanout * có số lượng nút trong lớp 1, v.v.

This way each node only has to communicate with a maximum of `2 * DATA_PLANE_FANOUT - 1` nodes.

Sơ đồ sau đây cho thấy cách Người lãnh đạo gửi các mẩu tin với tỷ lệ 2 đến Vùng lân cận 0 trong Lớp 0 và cách các nút trong Vùng lân cận 0 chia sẻ dữ liệu của chúng với nhau.

![](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/images/image3.JPG)

Biểu đồ sau đây cho thấy cách người hâm mộ của Vùng lân cận 0 đến Vùng lân cận 1 và 2.

![](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/images/image4.JPG)

Cuối cùng, sơ đồ sau đây cho thấy một cụm hai lớp với fanout là 2.

![](https://github.com/nguyenxuanquang01/se06-24.5/blob/master/document/Solana/images/image5.JPG)

### Configuration Values

`DATA_PLANE_FANOUT` - Xác định kích thước của lớp 0. Các lớp tiếp theo phát triển theo hệ số `DATA_PLANE_FANOUT`. Số lượng các nút trong một vùng lân cận bằng giá trị fanout. Các vùng lân cận sẽ lấp đầy dung lượng trước khi những vùng mới được thêm vào, tức là nếu một vùng lân cận chưa đầy, nó phải là vùng cuối cùng.

Hiện tại, cấu hình được thiết lập khi khởi chạy cụm. Trong tương lai, các tham số này có thể được lưu trữ trên chuỗi, cho phép sửa đổi nhanh chóng khi kích thước cụm thay đổi.