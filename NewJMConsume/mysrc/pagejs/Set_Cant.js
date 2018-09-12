var now_page = 1;
dic_head = {
    Company: "公司",
    PlaceType: "消费地点",
    order_price_type: "餐次",
    ResourceName: "消费策略",
}
$(document).ready(function () {
    load(true, 1);
})

//加载页面
function load(isfirst, pc) {
    var feeplace = $("#feeplace").val();
    var jsonObj = {
        type: "set_cant_load",
        feeplace: feeplace,
        pc: pc
    }
    if (isfirst) {
        now_page = 1;
    }
    else {
        now_page = pc;
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_load);

}
//加载页面的回调
function callBack_load(data) {
    if (data.result == "ok") {
        $("#table").empty();
        if (data.execDt.length != 0) {
            generateTable(data.execDt, dic_head);
        }
        bindpaginator(data.numcount);
    }
}

//新建表
function generateTable(data, dic) {
    var table = document.getElementById("table");
    table.appendChild(generateTableThead(dic))
    var tbody = document.createElement("tbody");
    for (var i = 0; i < data.length; i++) {
        tbody.appendChild(generateTableRow(data[i], dic, i));
    }
    table.appendChild(tbody);
}
//制作表头
function generateTableThead(dic) {
    var thead = document.createElement("thead");
    var tr = document.createElement("tr");
    for (index in dic) {
        var th = document.createElement("th");
        th.innerHTML = dic[index];
        tr.appendChild(th);
    }
    var th2 = document.createElement("th");
    th2.innerHTML = "操作";
    tr.appendChild(th2);
    thead.appendChild(tr);
    return thead;
}
//新建一行
function generateTableRow(data, dic, i) {
    var tr = document.createElement("tr");
    tr.setAttribute("name", data["RoId"]);
    for (index in dic) {
        var td = document.createElement("td");

        td.innerHTML = data[index];
        tr.appendChild(td);

    }
    var td2 = document.createElement("td");
    td2.innerHTML = checkStatus(data["FeeID"]);
    tr.appendChild(td2);

    return tr;
}
//判断操作是否为启用或停用
function checkStatus(isuse) {
    var str = "";
    str = "<a onclick=\"setRole(this)\" name=" + isuse + " >编辑</a>|";
    str += "<a onclick=\"deleteRole(this.name)\" name=" + isuse + ">删除</a>";
    return str;
}

//分页插件
function bindpaginator(tatal) {
    var tp = Math.ceil(tatal / 10)
    $('#pageLimit').bootstrapPaginator({
        currentPage: now_page,//当前的请求页面。
        totalPages: tp,//一共多少页。
        size: "normal",//应该是页眉的大小。
        bootstrapMajorVersion: 3,//bootstrap的版本要求。
        alignment: "right",
        numberOfPages: 10,//一页列出多少数据。
        itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
            switch (type) {
                case "first": return "首页";
                case "prev": return "上一页";
                case "next": return "下一页";
                case "last": return "末页";
                case "page": return page;
            }
        },
        onPageClicked: function (event, originalEvent, type, page) {
            load(false, page);
        }
    });

}

//添加食堂
function addRole() {
    var company = $("#addcompany").val();
    var eattype = $("#addeattype").val();
    var feeplace = $("#addfeeplace").val();
    var feeresource = $("#addfeeresource").val();
    var jsonObj = {
        type: "set_cant_add",
        company: company,
        eattype: eattype,
        feeplace: feeplace,
        feeresource: feeresource
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_addRole);
}
//添加食堂回调
function callBack_addRole(data) {
    alert(data.msg);
    load(true, 1);
}
//删除饭堂
function deleteRole(id) {
    var jsonObj = {
        type: "set_cant_delete",
        id: id
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_deleteCant);
}
//删除饭堂的回调
function callBack_deleteCant(data) {
    alert(data.msg);
    load(true, 1);
}
//更新食堂
function updateCant() {
    var jsonObj = {
        type: "set_cant_load",
        id: id
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_load);
}
//更新食堂回调
function callBack_updateCant(data) {
    if (data.result == "ok") {
        var table = data.execDt[0];

    }
}
