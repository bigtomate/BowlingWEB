<!doctype html>
<html>
<head>
  <style>
   table.scoring {border: 1px solid #FFAA33; border-right:none;  border-collapse: collapse;}
   table.scoring td {border-right: 1px solid #FFAA33;width:25px !important;}
   table.frame {margin-left:10px;}
   table.frame th {text-align:left;}
</style>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Bowlingscoring Sheet</title>
</head>
<body>
<table style="margin-left:10px;">
  <thead>bowling sheet</thead>
  <tbody>
  <tr>
    <td>
      <button id="b0" class="scoringbtn">0</button>
      <button id="b1" class="scoringbtn">1</button>
      <button id="b2" class="scoringbtn">2</button>
      <button id="b3" class="scoringbtn">3</button>
      <button id="b4" class="scoringbtn">4</button>
      <button id="b5" class="scoringbtn">5</button>
      <button id="b6" class="scoringbtn">6</button>
      <button id="b7" class="scoringbtn">7</button>
      <button id="b8" class="scoringbtn">8</button>
      <button id="b9" class="scoringbtn">9</button>
      <button id="b10" class="scoringbtn">10</button>
    </td>
  </tr>
  </tbody>
</table>

<table class="frame" style="margin-top:40px;">
  <tbody>
  <tr>
    <th >1</th>
    <th >2</th>
    <th >3</th>
    <th >4</th>
    <th >5</th>
    <th >6</th>
    <th >7</th>
    <th >8</th>
    <th >9</th>
    <th>10</th>
  </tr>
  <tr>
    <td>
      <table class="scoring">
        <tr>
          <td>&nbsp;</td> <td>&nbsp;</td>
        </tr>
      </table>
    </td>
    <td>
      <table class="scoring">
        <tr>
          <td>&nbsp;</td> <td>&nbsp;</td>

        </tr>
      </table>
    </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>
  </tr>
  <tr>
    <td>
      <table class="scoring">
        <tr>
          <td>&nbsp;</td> <td>&nbsp;</td>
        </tr>
      </table>
    </td>
    <td>
      <table class="scoring">
        <tr>
          <td>&nbsp;</td> <td>&nbsp;</td>

        </tr>
      </table>
    </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td>&nbsp;</td> <td>&nbsp;</td>

      </tr>
    </table>
  </td>
  </tr>
  </tbody>
</table>

</body>
<form action="scoring" type="submit" id="currentsorceForm">
    <input id = "pindownlist" type="text"/>
</form>
<span id="displayScore"> ${score} </span>
</html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var pinDownList = '';
     var scoringBtns = document.getElementsByClassName("scoringbtn");
    for (var i = 0; i < scoringBtns.length; i++) {

      document.getElementById(scoringBtns.item(i).id).addEventListener('click', function() {
            var btnId = this.id;
            btnId = btnId.replace('b', '');
            var contentToAdd = pinDownList.length === 0? btnId : ',' + btnId;
            pinDownList = pinDownList + contentToAdd;
            $.ajax({
    url: window.location + 'scoring',
    data: { 
        "pinDownList": pinDownList
    },
    cache: false,
    type: "GET",
    success: function(response) {

    },
    error: function(xhr) {
    }
      });
    });
}
</script>
