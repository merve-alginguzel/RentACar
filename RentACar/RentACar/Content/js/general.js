//function CategoryDelete(ID) {
//    if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
//        $.ajax({
//            type: "POST",
//            url: "/backoffice/Category/CategoryDelete",


//            data: "ID=" + ID,
//            cache: false,
//            success: function (data) {
//                if (data == 1) {
//                    $("#Category_" + ID).css("display", "none");



//                }
//                else {
//                    alert("Problem mevcut. silinmedi.  Bu kategoriye ait ürün varsa silinmez.");
//                }
//            }
//        });

//    }

//    //$.ajax({


//    //    type: "POST",
//    //    url: "/backoffice/Category/CategoryDelete/",


//    //    data: "ID=" + ID,
//    //    cache: false,
//    //    success: function (data) {
//    //        if (data == 1) {
//    //            $("#Category_" + ID).css("display", "none");
//    //            $.notify("Kategori Silindi!", "success");
//    //        }
//    //        else {

//    //            $.notify("Problem mevcut. silinmedi.", "error");
//    //        }
//    //    }
//    //});
//}
//ÜLKE ve ŞEHİR SEÇME EVENT
$("#CountryList").change(function () {
    var CountryID = $(this).val();
    $.ajax({
        type: "post",
        url: '/backoffice/User/GetCityList',
        data: { CountryID: CountryID },
        success: function (data) {
            $.each(data, function (index, City) {
                $("#CityList").empty();
                $('#CityList').append($('<option/>', {
                    value: City.CityID,
                    text: City.CityName
                }));
            });
        }
    });
});
$("#CityList").change(function () {
    var CityID = $(this).val();
    $.ajax({
        type: "post",
        url: '/backoffice/User/GetTownList',
        data: { CityID: CityID },
        success: function (data) {
            $("#TownList").empty();
            $.each(data, function (index, Town) {
                $('#TownList').append($('<option/>', {
                    value: Town.TownID,
                    text: Town.TownName
                }));
            });
        }
    });
});


function CargoImageDelete(ID) {
{
        $.ajax({
            type: "POST",
            url: "/backoffice/Cargo/CargoImageDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#CargoImage_" + ID).css("display", "none");
                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}


function ArticleDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Article/ArticleDelete",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {
                $("#Article_" + ID).css("display", "none");

            }
            else {
                alert("Problem mevcut silinmedi.");
            }
        }
    });
}

function ArticleCategoryDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Article/DeleteArticleCategory",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {
                $("#ArticleCategory_" + ID).css("display", "none");

            }
            else {
                alert("Problem mevcut silinmedi.");
            }
        }
    });
}

function VariantProperyDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Module/VariantPropertyDelete",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {
                $("#VariantProp_" + ID).css("display", "none");

            }
            else {
                alert("Problem mevcut silinmedi.");
            }
        }
    });
}


function VariantDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Module/VariantDelete",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {
                $("#Variant_" + ID).css("display", "none");

            }
            else {
                alert("Problem mevcut silinmedi.");
            }
        }
    });
}




function SupplierDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Module/SupplierDelete",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {
                $("#Supplier_" + ID).css("display", "none");

            }
            else {
                alert("Problem mevcut silinmedi.");
            }
        }
    });
}




function DiscountDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Module/DiscountDelete",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {
                $("#Discount_" + ID).css("display", "none");

            }
            else {
                alert("Problem mevcut silinmedi.");
            }
        }
    });


}

function BrandDelete(ID) {
    //if (confirm("Kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Brand/BrandDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Brand_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
    //}

}

function BannerDelete(ID) {
    //if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Banner/BannerDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Banner_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    //}

}

function MenuDelete(ID) {
    //if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Menu/MenuDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Menu_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    //}

}

function ProductSizePropertyDelete(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/ProductSize/ProductSizePropertyDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#ProductSizeProperty_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}

function ProductDelete(ID) {
    //if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Product/ProductDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Product_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
   // }

}

function ProductStockDelete(ID) {
    //if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Product/ProductStockDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#ProductStock_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    //}

}

function ProductImageDelete(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Product/ProductImageDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#ProductImage_" + ID).css("display", "none");
                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}

function BrandImageDelete(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Brand/BrandImageDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#BrandImage_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}

function SubsDelete(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Subscriber/SubsDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Subs_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
    }

}

function OrderAccept(ID) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Order/OrderAccept",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {

            }
            else {

            }
        }
    });
}

function OrderReject(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Order/OrderReject",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {



                }
                else {

                }
            }
        });
    }

}

$('#CategoryID').on('change', function () {
    $.ajax({
        type: "POST",
        url: "/backoffice/Product/GetCategoryProperties",


        data: "ID=" + this.value,
        cache: false,
        success: function (data) {
            if (data == 1) {



            }
            else {

            }
        }
    });
});

function PageDelete(ID) {
    //if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Page/DeletePage",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Page_" + ID).css("display", "none");


                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
    //}

}

function DeleteSubProperty(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Product/DeleteSubProperty",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#SubProp_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
    }

}

function DeleteCategoryProperty(ID) {
    //if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Product/DeleteProperty",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Prop_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
   // }

}

function DeleteDesi(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Cargo/DeleteDesi",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Desi_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
    }

}

function CategoryImageDelete(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Category/CategoryImageDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#CategoryImage_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}

function RemoveBasket(ID) {
   // if (confirm("Sepeti silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Order/RemoveBasket",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Product_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    //}

}

function ActiveCoupon(ID) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Campaign/ActiveCoupon",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {

            }
            else {

            }
        }
    });
}


function PassiveCoupon(ID) {
    $.ajax({
        type: "POST",
        url: "/backoffice/Campaign/PassiveCoupon",


        data: "ID=" + ID,
        cache: false,
        success: function (data) {
            if (data == 1) {

            }
            else {

            }
        }
    });
}

function DeleteUserCoupon(ID) {
    if (confirm("Sepeti silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Campaign/DeleteUserCoupon",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Coupon_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}




function DeleteCargo(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Cargo/CargoDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#Cargo_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi.  Bu markaya ait ürün varsa silinmez.");
                }
            }
        });
    }

}


function VarintStockImageDelete(ID) {
    if (confirm("Silmek kaydı silmek istediğinizden emin misiniz?")) {
        $.ajax({
            type: "POST",
            url: "/backoffice/Module/StockImageDelete",


            data: "ID=" + ID,
            cache: false,
            success: function (data) {
                if (data == 1) {
                    $("#ProductImage_" + ID).css("display", "none");



                }
                else {
                    alert("Problem mevcut. silinmedi. ");
                }
            }
        });
    }

}


// Menü aktif fonksiyonu

$.urlParam = function (name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results != null)
        return decodeURIComponent(results[1]) || 0;
    else
        return null;
}

$(document).ready(function () {

    $('.categorypop').popover();

    //console.log(window.location.pathname); console.log(window.location.search);
    ActiveUl(window.location.pathname + window.location.search);

    $('[data-toggle="tooltip"]').tooltip();   
});

function ActiveUl(url) {
    $('#side-nav').each(function (id, val) {
        if ($('a', val).attr('href') != url) {
            ActiveLi(url, val)
        }
        else {
            $("a[href$='" + url + "']", val).toggleClass('active');
            return false;
        }
    });
}

function ActiveLi(url, vals) {     
    $('li', vals).each(function (id, val) {
        
        if ($('a', val).attr('href') != url) {
            //ActiveUl(url)
        }
        else {
            //debugger;
            $("a[href$='" + url + "']", val).toggleClass('active2');
            $("a[href$='" + url + "']", val).parent().parent().toggleClass('in');
            $("a[href$='" + url + "']", val).parent().parent().parent().eq(0).toggleClass('active');
            return false;
        }

    });
}

$('.wc-layered-nav-term a[data-category]').click(function (e) {
    e.preventDefault();
    var str = ";" + $(this).data('category') + "=";
    $(this).toggleClass('active');
    $('#Prop_' + $(this).data('category') + ' .wc-layered-nav-term').each(function (idx, val) {
        if ($('a', val).hasClass('active')) {
            str += $('span', val).text() + ',';
        }
    });
    $('#' + $(this).data('category')).val(str);
});


$("#search").autocomplete({
    source: function (request, response) {
        $.ajax({
            url: "/backoffice/Product/AutoComplete",
            type: "POST",
            dataType: "json",
            data: { search: request.term },
            success: function (data) {
                response($.map(data, function (item) {
                    return { label: item.Name, value: item.Name };
                }));
            }
        });
    },
    appendTo: "#results",
    position: { collision: "flip" },
    messages: {
        noResults: "", results: ""
    }
});