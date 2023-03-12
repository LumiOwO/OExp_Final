<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D3_n" />
        <signal name="D2_n" />
        <signal name="D1_n" />
        <signal name="XLXN_6" />
        <signal name="D0_n" />
        <signal name="D3" />
        <signal name="XLXN_9" />
        <signal name="D1" />
        <signal name="XLXN_11" />
        <signal name="D2" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="D0" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="LE" />
        <signal name="point" />
        <signal name="p" />
        <signal name="g" />
        <signal name="f" />
        <signal name="e" />
        <signal name="d" />
        <signal name="c" />
        <signal name="b" />
        <signal name="a" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="LE" />
        <port polarity="Input" name="point" />
        <port polarity="Output" name="p" />
        <port polarity="Output" name="g" />
        <port polarity="Output" name="f" />
        <port polarity="Output" name="e" />
        <port polarity="Output" name="d" />
        <port polarity="Output" name="c" />
        <port polarity="Output" name="b" />
        <port polarity="Output" name="a" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="and4" name="XLXI_5">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D2_n" name="I1" />
            <blockpin signalname="D1_n" name="I2" />
            <blockpin signalname="D3_n" name="I3" />
            <blockpin signalname="XLXN_24" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_6">
            <blockpin signalname="D0_n" name="I0" />
            <blockpin signalname="D1_n" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3_n" name="I3" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_7">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1_n" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_26" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_8">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2_n" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_28" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_9">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1_n" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3_n" name="I3" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_10">
            <blockpin signalname="D0_n" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_11">
            <blockpin signalname="D0_n" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_12">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_13">
            <blockpin signalname="D0_n" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2_n" name="I2" />
            <blockpin signalname="D3_n" name="I3" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_14">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3" name="I2" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_15">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_34" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_1">
            <blockpin signalname="D3" name="I" />
            <blockpin signalname="D3_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="D2" name="I" />
            <blockpin signalname="D2_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="D1" name="I" />
            <blockpin signalname="D1_n" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_4">
            <blockpin signalname="D0" name="I" />
            <blockpin signalname="D0_n" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_31">
            <blockpin signalname="D0_n" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2_n" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_32">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D3_n" name="I1" />
            <blockpin signalname="XLXN_35" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_33">
            <blockpin signalname="D1_n" name="I0" />
            <blockpin signalname="D2" name="I1" />
            <blockpin signalname="D3_n" name="I2" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_34">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1_n" name="I1" />
            <blockpin signalname="D2_n" name="I2" />
            <blockpin signalname="XLXN_36" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_35">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D2_n" name="I1" />
            <blockpin signalname="D3_n" name="I2" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_36">
            <blockpin signalname="D1" name="I0" />
            <blockpin signalname="D2_n" name="I1" />
            <blockpin signalname="D3_n" name="I2" />
            <blockpin signalname="XLXN_37" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_37">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D3_n" name="I2" />
            <blockpin signalname="XLXN_38" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_38">
            <blockpin signalname="D1_n" name="I0" />
            <blockpin signalname="D2_n" name="I1" />
            <blockpin signalname="D3_n" name="I2" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_39">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3_n" name="I3" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_40">
            <blockpin signalname="D0_n" name="I0" />
            <blockpin signalname="D1_n" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_41">
            <blockpin signalname="XLXN_28" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_25" name="I2" />
            <blockpin signalname="XLXN_24" name="I3" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_42">
            <blockpin signalname="XLXN_32" name="I0" />
            <blockpin signalname="XLXN_30" name="I1" />
            <blockpin signalname="XLXN_17" name="I2" />
            <blockpin signalname="XLXN_29" name="I3" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_44">
            <blockpin signalname="XLXN_33" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_30" name="I2" />
            <blockpin signalname="XLXN_43" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_45">
            <blockpin signalname="XLXN_19" name="I0" />
            <blockpin signalname="XLXN_34" name="I1" />
            <blockpin signalname="XLXN_25" name="I2" />
            <blockpin signalname="XLXN_24" name="I3" />
            <blockpin signalname="XLXN_44" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_46">
            <blockpin signalname="XLXN_36" name="I0" />
            <blockpin signalname="XLXN_20" name="I1" />
            <blockpin signalname="XLXN_35" name="I2" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_47">
            <blockpin signalname="XLXN_38" name="I0" />
            <blockpin signalname="XLXN_37" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="XLXN_26" name="I3" />
            <blockpin signalname="XLXN_46" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_48">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_22" name="I1" />
            <blockpin signalname="XLXN_39" name="I2" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_49">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_41" name="I1" />
            <blockpin signalname="a" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_50">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_42" name="I1" />
            <blockpin signalname="b" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_51">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_43" name="I1" />
            <blockpin signalname="c" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_52">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_44" name="I1" />
            <blockpin signalname="d" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_53">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_45" name="I1" />
            <blockpin signalname="e" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_54">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_46" name="I1" />
            <blockpin signalname="f" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_55">
            <blockpin signalname="LE" name="I0" />
            <blockpin signalname="XLXN_48" name="I1" />
            <blockpin signalname="g" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_56">
            <blockpin signalname="point" name="I" />
            <blockpin signalname="p" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="2160" y="864" name="XLXI_6" orien="R0" />
        <instance x="2160" y="2400" name="XLXI_13" orien="R0" />
        <instance x="2160" y="2592" name="XLXI_14" orien="R0" />
        <instance x="2160" y="2784" name="XLXI_15" orien="R0" />
        <instance x="2160" y="3056" name="XLXI_31" orien="R0" />
        <instance x="2160" y="3216" name="XLXI_32" orien="R0" />
        <instance x="2160" y="3424" name="XLXI_33" orien="R0" />
        <instance x="2160" y="3632" name="XLXI_34" orien="R0" />
        <instance x="2160" y="3840" name="XLXI_35" orien="R0" />
        <instance x="2160" y="4032" name="XLXI_36" orien="R0" />
        <instance x="2160" y="4240" name="XLXI_37" orien="R0" />
        <instance x="2160" y="4448" name="XLXI_38" orien="R0" />
        <instance x="2160" y="4720" name="XLXI_39" orien="R0" />
        <instance x="2160" y="4976" name="XLXI_40" orien="R0" />
        <instance x="2160" y="2144" name="XLXI_12" orien="R0" />
        <instance x="2160" y="1968" name="XLXI_11" orien="R0" />
        <instance x="2160" y="1792" name="XLXI_10" orien="R0" />
        <instance x="2160" y="1600" name="XLXI_9" orien="R0" />
        <instance x="2160" y="1344" name="XLXI_8" orien="R0" />
        <instance x="2160" y="1104" name="XLXI_7" orien="R0" />
        <instance x="2160" y="608" name="XLXI_5" orien="R0" />
        <branch name="D3_n">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1072" y="352" type="branch" />
            <wire x2="1072" y1="352" y2="352" x1="1040" />
            <wire x2="2000" y1="352" y2="352" x1="1072" />
            <wire x2="2160" y1="352" y2="352" x1="2000" />
            <wire x2="2000" y1="352" y2="608" x1="2000" />
            <wire x2="2160" y1="608" y2="608" x1="2000" />
            <wire x2="2000" y1="608" y2="1344" x1="2000" />
            <wire x2="2160" y1="1344" y2="1344" x1="2000" />
            <wire x2="2000" y1="1344" y2="2144" x1="2000" />
            <wire x2="2160" y1="2144" y2="2144" x1="2000" />
            <wire x2="2000" y1="2144" y2="3088" x1="2000" />
            <wire x2="2160" y1="3088" y2="3088" x1="2000" />
            <wire x2="2000" y1="3088" y2="3232" x1="2000" />
            <wire x2="2160" y1="3232" y2="3232" x1="2000" />
            <wire x2="2000" y1="3232" y2="3648" x1="2000" />
            <wire x2="2160" y1="3648" y2="3648" x1="2000" />
            <wire x2="2000" y1="3648" y2="3840" x1="2000" />
            <wire x2="2160" y1="3840" y2="3840" x1="2000" />
            <wire x2="2000" y1="3840" y2="4048" x1="2000" />
            <wire x2="2160" y1="4048" y2="4048" x1="2000" />
            <wire x2="2000" y1="4048" y2="4256" x1="2000" />
            <wire x2="2000" y1="4256" y2="4464" x1="2000" />
            <wire x2="2160" y1="4464" y2="4464" x1="2000" />
            <wire x2="2160" y1="4256" y2="4256" x1="2000" />
        </branch>
        <instance x="816" y="384" name="XLXI_1" orien="R0" />
        <branch name="D2_n">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1072" y="480" type="branch" />
            <wire x2="1072" y1="480" y2="480" x1="1040" />
            <wire x2="1936" y1="480" y2="480" x1="1072" />
            <wire x2="2160" y1="480" y2="480" x1="1936" />
            <wire x2="1936" y1="480" y2="1152" x1="1936" />
            <wire x2="2160" y1="1152" y2="1152" x1="1936" />
            <wire x2="1936" y1="1152" y2="2208" x1="1936" />
            <wire x2="2160" y1="2208" y2="2208" x1="1936" />
            <wire x2="1936" y1="2208" y2="2864" x1="1936" />
            <wire x2="2160" y1="2864" y2="2864" x1="1936" />
            <wire x2="1936" y1="2864" y2="3440" x1="1936" />
            <wire x2="2160" y1="3440" y2="3440" x1="1936" />
            <wire x2="1936" y1="3440" y2="3712" x1="1936" />
            <wire x2="2160" y1="3712" y2="3712" x1="1936" />
            <wire x2="1936" y1="3712" y2="3904" x1="1936" />
            <wire x2="1936" y1="3904" y2="4320" x1="1936" />
            <wire x2="2160" y1="4320" y2="4320" x1="1936" />
            <wire x2="2160" y1="3904" y2="3904" x1="1936" />
        </branch>
        <instance x="816" y="512" name="XLXI_2" orien="R0" />
        <branch name="D1_n">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1069" y="736" type="branch" />
            <wire x2="1069" y1="736" y2="736" x1="1040" />
            <wire x2="1872" y1="736" y2="736" x1="1069" />
            <wire x2="2160" y1="736" y2="736" x1="1872" />
            <wire x2="1872" y1="736" y2="976" x1="1872" />
            <wire x2="2160" y1="976" y2="976" x1="1872" />
            <wire x2="1872" y1="976" y2="1472" x1="1872" />
            <wire x2="2160" y1="1472" y2="1472" x1="1872" />
            <wire x2="1872" y1="1472" y2="3360" x1="1872" />
            <wire x2="2160" y1="3360" y2="3360" x1="1872" />
            <wire x2="1872" y1="3360" y2="3504" x1="1872" />
            <wire x2="2160" y1="3504" y2="3504" x1="1872" />
            <wire x2="1872" y1="3504" y2="4384" x1="1872" />
            <wire x2="1872" y1="4384" y2="4848" x1="1872" />
            <wire x2="2160" y1="4848" y2="4848" x1="1872" />
            <wire x2="2160" y1="4384" y2="4384" x1="1872" />
            <wire x2="2160" y1="416" y2="416" x1="1872" />
            <wire x2="1872" y1="416" y2="736" x1="1872" />
        </branch>
        <instance x="816" y="768" name="XLXI_3" orien="R0" />
        <instance x="816" y="1008" name="XLXI_4" orien="R0" />
        <branch name="D0_n">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1072" y="976" type="branch" />
            <wire x2="1072" y1="976" y2="976" x1="1040" />
            <wire x2="1808" y1="976" y2="976" x1="1072" />
            <wire x2="1808" y1="976" y2="1728" x1="1808" />
            <wire x2="2160" y1="1728" y2="1728" x1="1808" />
            <wire x2="1808" y1="1728" y2="1904" x1="1808" />
            <wire x2="2160" y1="1904" y2="1904" x1="1808" />
            <wire x2="1808" y1="1904" y2="2336" x1="1808" />
            <wire x2="2160" y1="2336" y2="2336" x1="1808" />
            <wire x2="1808" y1="2336" y2="2992" x1="1808" />
            <wire x2="1808" y1="2992" y2="4912" x1="1808" />
            <wire x2="2160" y1="4912" y2="4912" x1="1808" />
            <wire x2="2160" y1="2992" y2="2992" x1="1808" />
            <wire x2="2160" y1="800" y2="800" x1="1808" />
            <wire x2="1808" y1="800" y2="976" x1="1808" />
        </branch>
        <branch name="D3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="662" y="352" type="branch" />
            <wire x2="640" y1="352" y2="352" x1="560" />
            <wire x2="640" y1="352" y2="416" x1="640" />
            <wire x2="1456" y1="416" y2="416" x1="640" />
            <wire x2="1456" y1="416" y2="848" x1="1456" />
            <wire x2="2160" y1="848" y2="848" x1="1456" />
            <wire x2="1456" y1="848" y2="1088" x1="1456" />
            <wire x2="2160" y1="1088" y2="1088" x1="1456" />
            <wire x2="1456" y1="1088" y2="1776" x1="1456" />
            <wire x2="2160" y1="1776" y2="1776" x1="1456" />
            <wire x2="1456" y1="1776" y2="1952" x1="1456" />
            <wire x2="2160" y1="1952" y2="1952" x1="1456" />
            <wire x2="1456" y1="1952" y2="2400" x1="1456" />
            <wire x2="2160" y1="2400" y2="2400" x1="1456" />
            <wire x2="1456" y1="2400" y2="2800" x1="1456" />
            <wire x2="1456" y1="2800" y2="4720" x1="1456" />
            <wire x2="2160" y1="4720" y2="4720" x1="1456" />
            <wire x2="2160" y1="2800" y2="2800" x1="1456" />
            <wire x2="662" y1="352" y2="352" x1="640" />
            <wire x2="816" y1="352" y2="352" x1="662" />
        </branch>
        <branch name="D1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="656" y="736" type="branch" />
            <wire x2="640" y1="736" y2="736" x1="560" />
            <wire x2="640" y1="736" y2="800" x1="640" />
            <wire x2="1328" y1="800" y2="800" x1="640" />
            <wire x2="1328" y1="800" y2="1216" x1="1328" />
            <wire x2="2160" y1="1216" y2="1216" x1="1328" />
            <wire x2="1328" y1="1216" y2="1664" x1="1328" />
            <wire x2="2160" y1="1664" y2="1664" x1="1328" />
            <wire x2="1328" y1="1664" y2="2016" x1="1328" />
            <wire x2="2160" y1="2016" y2="2016" x1="1328" />
            <wire x2="1328" y1="2016" y2="2272" x1="1328" />
            <wire x2="2160" y1="2272" y2="2272" x1="1328" />
            <wire x2="1328" y1="2272" y2="2528" x1="1328" />
            <wire x2="2160" y1="2528" y2="2528" x1="1328" />
            <wire x2="1328" y1="2528" y2="2656" x1="1328" />
            <wire x2="2160" y1="2656" y2="2656" x1="1328" />
            <wire x2="1328" y1="2656" y2="2928" x1="1328" />
            <wire x2="2160" y1="2928" y2="2928" x1="1328" />
            <wire x2="1328" y1="2928" y2="3968" x1="1328" />
            <wire x2="2160" y1="3968" y2="3968" x1="1328" />
            <wire x2="1328" y1="3968" y2="4112" x1="1328" />
            <wire x2="1328" y1="4112" y2="4592" x1="1328" />
            <wire x2="2160" y1="4592" y2="4592" x1="1328" />
            <wire x2="2160" y1="4112" y2="4112" x1="1328" />
            <wire x2="656" y1="736" y2="736" x1="640" />
            <wire x2="816" y1="736" y2="736" x1="656" />
        </branch>
        <branch name="D2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="656" y="480" type="branch" />
            <wire x2="640" y1="480" y2="480" x1="560" />
            <wire x2="640" y1="480" y2="672" x1="640" />
            <wire x2="1392" y1="672" y2="672" x1="640" />
            <wire x2="2160" y1="672" y2="672" x1="1392" />
            <wire x2="1392" y1="672" y2="912" x1="1392" />
            <wire x2="2160" y1="912" y2="912" x1="1392" />
            <wire x2="1392" y1="912" y2="1408" x1="1392" />
            <wire x2="2160" y1="1408" y2="1408" x1="1392" />
            <wire x2="1392" y1="1408" y2="1600" x1="1392" />
            <wire x2="2160" y1="1600" y2="1600" x1="1392" />
            <wire x2="1392" y1="1600" y2="1840" x1="1392" />
            <wire x2="2160" y1="1840" y2="1840" x1="1392" />
            <wire x2="1392" y1="1840" y2="2464" x1="1392" />
            <wire x2="2160" y1="2464" y2="2464" x1="1392" />
            <wire x2="1392" y1="2464" y2="2592" x1="1392" />
            <wire x2="2160" y1="2592" y2="2592" x1="1392" />
            <wire x2="1392" y1="2592" y2="3296" x1="1392" />
            <wire x2="2160" y1="3296" y2="3296" x1="1392" />
            <wire x2="1392" y1="3296" y2="4528" x1="1392" />
            <wire x2="1392" y1="4528" y2="4784" x1="1392" />
            <wire x2="2160" y1="4784" y2="4784" x1="1392" />
            <wire x2="2160" y1="4528" y2="4528" x1="1392" />
            <wire x2="656" y1="480" y2="480" x1="640" />
            <wire x2="816" y1="480" y2="480" x1="656" />
        </branch>
        <branch name="D0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="656" y="976" type="branch" />
            <wire x2="640" y1="976" y2="976" x1="560" />
            <wire x2="640" y1="976" y2="1040" x1="640" />
            <wire x2="1264" y1="1040" y2="1040" x1="640" />
            <wire x2="2160" y1="1040" y2="1040" x1="1264" />
            <wire x2="1264" y1="1040" y2="1280" x1="1264" />
            <wire x2="2160" y1="1280" y2="1280" x1="1264" />
            <wire x2="1264" y1="1280" y2="1536" x1="1264" />
            <wire x2="2160" y1="1536" y2="1536" x1="1264" />
            <wire x2="1264" y1="1536" y2="2080" x1="1264" />
            <wire x2="2160" y1="2080" y2="2080" x1="1264" />
            <wire x2="1264" y1="2080" y2="2720" x1="1264" />
            <wire x2="2160" y1="2720" y2="2720" x1="1264" />
            <wire x2="1264" y1="2720" y2="3152" x1="1264" />
            <wire x2="2160" y1="3152" y2="3152" x1="1264" />
            <wire x2="1264" y1="3152" y2="3568" x1="1264" />
            <wire x2="2160" y1="3568" y2="3568" x1="1264" />
            <wire x2="1264" y1="3568" y2="3776" x1="1264" />
            <wire x2="2160" y1="3776" y2="3776" x1="1264" />
            <wire x2="1264" y1="3776" y2="4176" x1="1264" />
            <wire x2="1264" y1="4176" y2="4656" x1="1264" />
            <wire x2="2160" y1="4656" y2="4656" x1="1264" />
            <wire x2="2160" y1="4176" y2="4176" x1="1264" />
            <wire x2="656" y1="976" y2="976" x1="640" />
            <wire x2="816" y1="976" y2="976" x1="656" />
            <wire x2="2160" y1="544" y2="544" x1="1264" />
            <wire x2="1264" y1="544" y2="1040" x1="1264" />
        </branch>
        <instance x="3184" y="2368" name="XLXI_44" orien="R0" />
        <instance x="3184" y="896" name="XLXI_41" orien="R0" />
        <branch name="XLXN_17">
            <wire x2="3184" y1="1664" y2="1664" x1="2416" />
        </branch>
        <instance x="3184" y="1856" name="XLXI_42" orien="R0" />
        <branch name="XLXN_18">
            <wire x2="3184" y1="2240" y2="2240" x1="2416" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="3184" y1="2896" y2="2896" x1="2416" />
        </branch>
        <instance x="3184" y="2960" name="XLXI_45" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="3184" y1="3296" y2="3296" x1="2416" />
        </branch>
        <instance x="3184" y="3424" name="XLXI_46" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="3184" y1="3712" y2="3712" x1="2416" />
        </branch>
        <instance x="3184" y="3904" name="XLXI_47" orien="R0" />
        <branch name="XLXN_22">
            <wire x2="3184" y1="4560" y2="4560" x1="2416" />
        </branch>
        <instance x="3184" y="4688" name="XLXI_48" orien="R0" />
        <branch name="XLXN_24">
            <wire x2="3040" y1="448" y2="448" x1="2416" />
            <wire x2="3184" y1="448" y2="448" x1="3040" />
            <wire x2="3184" y1="448" y2="640" x1="3184" />
            <wire x2="3040" y1="448" y2="2704" x1="3040" />
            <wire x2="3184" y1="2704" y2="2704" x1="3040" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="2960" y1="704" y2="704" x1="2416" />
            <wire x2="2960" y1="704" y2="2768" x1="2960" />
            <wire x2="3184" y1="2768" y2="2768" x1="2960" />
            <wire x2="3184" y1="704" y2="704" x1="2960" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="2880" y1="944" y2="944" x1="2416" />
            <wire x2="2880" y1="944" y2="3648" x1="2880" />
            <wire x2="3184" y1="3648" y2="3648" x1="2880" />
            <wire x2="3184" y1="768" y2="768" x1="2880" />
            <wire x2="2880" y1="768" y2="944" x1="2880" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="3184" y1="1184" y2="1184" x1="2416" />
            <wire x2="3184" y1="832" y2="1184" x1="3184" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="3184" y1="1440" y2="1440" x1="2416" />
            <wire x2="3184" y1="1440" y2="1600" x1="3184" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="2800" y1="1840" y2="1840" x1="2416" />
            <wire x2="2800" y1="1840" y2="2176" x1="2800" />
            <wire x2="3184" y1="2176" y2="2176" x1="2800" />
            <wire x2="2800" y1="1728" y2="1840" x1="2800" />
            <wire x2="3184" y1="1728" y2="1728" x1="2800" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="3184" y1="2016" y2="2016" x1="2416" />
            <wire x2="3184" y1="1792" y2="2016" x1="3184" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="3184" y1="2464" y2="2464" x1="2416" />
            <wire x2="3184" y1="2304" y2="2464" x1="3184" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="2800" y1="2656" y2="2656" x1="2416" />
            <wire x2="2800" y1="2656" y2="2832" x1="2800" />
            <wire x2="3184" y1="2832" y2="2832" x1="2800" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="3184" y1="3120" y2="3120" x1="2416" />
            <wire x2="3184" y1="3120" y2="3232" x1="3184" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="3184" y1="3504" y2="3504" x1="2416" />
            <wire x2="3184" y1="3360" y2="3504" x1="3184" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="2880" y1="3904" y2="3904" x1="2416" />
            <wire x2="3184" y1="3776" y2="3776" x1="2880" />
            <wire x2="2880" y1="3776" y2="3904" x1="2880" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="3184" y1="4112" y2="4112" x1="2416" />
            <wire x2="3184" y1="3840" y2="4112" x1="3184" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="3184" y1="4320" y2="4320" x1="2416" />
            <wire x2="3184" y1="4320" y2="4496" x1="3184" />
        </branch>
        <branch name="XLXN_40">
            <wire x2="3184" y1="4816" y2="4816" x1="2416" />
            <wire x2="3184" y1="4624" y2="4816" x1="3184" />
        </branch>
        <instance x="4224" y="864" name="XLXI_49" orien="R0" />
        <instance x="4224" y="1824" name="XLXI_50" orien="R0" />
        <branch name="XLXN_41">
            <wire x2="4224" y1="736" y2="736" x1="3440" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="4224" y1="1696" y2="1696" x1="3440" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="4224" y1="2240" y2="2240" x1="3440" />
        </branch>
        <branch name="XLXN_44">
            <wire x2="4224" y1="2800" y2="2800" x1="3440" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="4224" y1="3296" y2="3296" x1="3440" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="4224" y1="3744" y2="3744" x1="3440" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="4224" y1="4560" y2="4560" x1="3440" />
        </branch>
        <instance x="4224" y="2368" name="XLXI_51" orien="R0" />
        <instance x="4224" y="2928" name="XLXI_52" orien="R0" />
        <instance x="4224" y="3424" name="XLXI_53" orien="R0" />
        <instance x="4224" y="3872" name="XLXI_54" orien="R0" />
        <instance x="4224" y="4688" name="XLXI_55" orien="R0" />
        <branch name="LE">
            <wire x2="3920" y1="5280" y2="5280" x1="560" />
            <wire x2="4224" y1="800" y2="800" x1="3920" />
            <wire x2="3920" y1="800" y2="1760" x1="3920" />
            <wire x2="4224" y1="1760" y2="1760" x1="3920" />
            <wire x2="3920" y1="1760" y2="2304" x1="3920" />
            <wire x2="4224" y1="2304" y2="2304" x1="3920" />
            <wire x2="3920" y1="2304" y2="2864" x1="3920" />
            <wire x2="4224" y1="2864" y2="2864" x1="3920" />
            <wire x2="3920" y1="2864" y2="3360" x1="3920" />
            <wire x2="4224" y1="3360" y2="3360" x1="3920" />
            <wire x2="3920" y1="3360" y2="3808" x1="3920" />
            <wire x2="4224" y1="3808" y2="3808" x1="3920" />
            <wire x2="3920" y1="3808" y2="4624" x1="3920" />
            <wire x2="4224" y1="4624" y2="4624" x1="3920" />
            <wire x2="3920" y1="4624" y2="5280" x1="3920" />
        </branch>
        <branch name="point">
            <wire x2="1472" y1="5088" y2="5088" x1="560" />
            <wire x2="1568" y1="5088" y2="5088" x1="1472" />
        </branch>
        <instance x="1568" y="5120" name="XLXI_56" orien="R0" />
        <branch name="p">
            <wire x2="4720" y1="5088" y2="5088" x1="1792" />
        </branch>
        <branch name="g">
            <wire x2="4720" y1="4592" y2="4592" x1="4480" />
        </branch>
        <branch name="f">
            <wire x2="4720" y1="3776" y2="3776" x1="4480" />
        </branch>
        <branch name="e">
            <wire x2="4720" y1="3328" y2="3328" x1="4480" />
        </branch>
        <branch name="d">
            <wire x2="4720" y1="2832" y2="2832" x1="4480" />
        </branch>
        <branch name="c">
            <wire x2="4720" y1="2272" y2="2272" x1="4480" />
        </branch>
        <branch name="b">
            <wire x2="4720" y1="1728" y2="1728" x1="4480" />
        </branch>
        <branch name="a">
            <wire x2="4720" y1="768" y2="768" x1="4480" />
        </branch>
        <iomarker fontsize="28" x="560" y="352" name="D3" orien="R180" />
        <iomarker fontsize="28" x="560" y="480" name="D2" orien="R180" />
        <iomarker fontsize="28" x="560" y="736" name="D1" orien="R180" />
        <iomarker fontsize="28" x="560" y="976" name="D0" orien="R180" />
        <iomarker fontsize="28" x="560" y="5088" name="point" orien="R180" />
        <iomarker fontsize="28" x="560" y="5280" name="LE" orien="R180" />
        <iomarker fontsize="28" x="4720" y="5088" name="p" orien="R0" />
        <iomarker fontsize="28" x="4720" y="768" name="a" orien="R0" />
        <iomarker fontsize="28" x="4720" y="1728" name="b" orien="R0" />
        <iomarker fontsize="28" x="4720" y="2272" name="c" orien="R0" />
        <iomarker fontsize="28" x="4720" y="2832" name="d" orien="R0" />
        <iomarker fontsize="28" x="4720" y="3328" name="e" orien="R0" />
        <iomarker fontsize="28" x="4720" y="3776" name="f" orien="R0" />
        <iomarker fontsize="28" x="4720" y="4592" name="g" orien="R0" />
    </sheet>
</drawing>