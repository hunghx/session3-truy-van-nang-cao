-- 1. Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên, họ tên 
-- nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp 
-- theo tuổi.
select *, year(now()) - year(ngaysinh) as tuoi from nhanvien order by tuoi ;
-- 2. Liệt kê các hóa đơn nhập hàng trong tháng 6/2018, gồm thông tin số phiếu 
-- nhập, mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày
-- nhập hàng, ghi chú. 

select pn.sopn,pn.manv,nv.Hoten,ncc.tenncc,pn.ngaynhap,pn.ghichu 
from phieunhap pn join nhanvien nv on pn.manv = nv.manv 
join nhacungcap ncc on pn.mancc = ncc.mancc;

-- 3. Liệt kê tất cả sản phẩm có đơn vị tính là chai, gồm tất cả thông tin về sản 
-- phẩm.
select * from sanpham where tensp like '%s%';
-- 4. Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: số phiếu 
-- nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá 
-- nhập, thành tiền.

select ct.sopn,ct.masp,sp.tensp,lsp.tenloaisp,sp.donvitinh,ct.soluong,ct.gianhap, ct.soluong*ct.gianhap as thanhtien 
from ctphieunhap ct join sanpham sp on ct.masp = sp.masp
join loaisp lsp on sp.maloaisp = lsp.maloaisp
join phieunhap pn on pn.sopn= ct.sopn
where month(now()) = month(pn.ngaynhap) and year(now()) = year(pn.ngaynhap);

-- 5. Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm 
-- thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại, 
-- email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.
-- 6. Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2018 gồm thông tin: 
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, 
-- đơn vị tính, số lượng, giá bán, doanh thu.
-- 7. Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm 
-- tất cả thông tin của khách hàng)
-- 8. Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018 gồm các 
-- thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên 
-- sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
-- 9. Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: số 
-- phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.
select px.sopx,px.ngayban,px.makh,kh.tenkh, sum(ct.soluong * ct.giaban) as trigia
from phieuxuat px join ctphieuxuat ct on px.sopx = ct.sopx
join khachhang kh on kh.makh = px.makh
group by ct.sopx;

-- 10. Cho biết tổng số chai nước xả vải Comfort đã bán trong 6 tháng đầu năm 
-- 2018. Thông tin hiển thị: tổng số lượng.
-- 11.Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin: 
-- tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.
-- 12.Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm, gồm 
-- thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số 
-- lượng.
-- 13.Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, thông tin 
-- hiển thị gồm: tháng, doanh thu.
select month(px.ngayban) thang, sum(ct.giaban*ct.soluong) doanhthu 
from phieuxuat px join ctphieuxuat ct on px.sopx = ct.sopx
where year(px.ngayban) = year(now()) and month(px.ngayban) >=6
group by month(px.ngayban)
;

-- 14.Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, gồm các 
-- thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, 
-- tổng trị giá.
-- 15.Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin 
-- gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán 
-- hàng, ngày bán, trị giá.

-- 16.Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin: mã nhân 
-- viên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số 
-- lượng.

-- 17.Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 2/2018, 
-- thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị 
-- tính, số lượng, đơn giá, thành tiền.
-- 18.Liệt kê các sản phẩm chưa bán được trong 6 tháng đầu năm 2018, thông tin 
-- gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính. 
select * from sanpham where masp 
not in (select * from sp_view);
-- 19.Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong 
-- quý 2/2018, gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số 
-- điện thoại. 
-- 20.Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng đầu năm 
-- 2018. 
-- 21.Cho biết mã khách hàng và số lượng đơn đặt hàng của mỗi khách hàng.
-- 22.Cho biết mã nhân viên, tên nhân viên, tên khách hàng kể cả những nhân viên 
-- không đại diện bán hàng.
-- 23.Cho biết số lượng nhân viên nam, số lượng nhân viên nữ
-- 24.Cho biết mã nhân viên, tên nhân viên, số năm làm việc của những nhân viên 
-- có thâm niên cao nhất.
-- 25.Hãy cho biết họ tên của những nhân viên đã đến tuổi về hưu (nam:60 tuổi, 
-- nữ: 55 tuổi)
select *,year(now())-year(nv.ngaysinh) from nhanvien nv 
where (nv.gioitinh = 1 and year(now())-year(nv.ngaysinh)>=60) or(nv.gioitinh = 0 and year(now())-year(nv.ngaysinh)>=55);
-- 26.Hãy cho biết họ tên của nhân viên và năm về hưu của họ. 
-- 27.Cho biết tiền thưởng tết dương lịch của từng nhân viên. Biết rằng - thâm 
-- niên <1 năm thưởng 200.000 - 1 năm <= thâm niên < 3 năm thưởng 
-- 400.000 - 3 năm <= thâm niên < 5 năm thưởng 600.000 - 5 năm <= thâm 
-- niên < 10 năm thưởng 800.000 - thâm niên >= 10 năm thưởng 1.000.000
-- 28.Cho biết những sản phẩm thuộc ngành hàng Hóa mỹ phẩm
-- 29.Cho biết những sản phẩm thuộc loại Quần áo.
-- 30.Cho biết số lượng sản phẩm loại Quần áo.
-- 31.Cho biết số lượng loại sản phẩm ngành hàng Hóa mỹ phẩm.
-- 32.Cho biết số lượng sản phẩm theo từng loại sản phẩm.


-- create view sp_view as select ct.masp from phieuxuat px join ctphieuxuat ct on px.sopx = ct.sopx 
-- join sanpham sp on sp.masp = ct.masp 
-- join loaisp lsp on sp.maloaisp = lsp.maloaisp; 