# 跳过数据区
	j Welcome;

# 数据区
# 原始地图数据： 10 x 10 Addr = 0x00000008
Map:
	.WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; 
	.WORD 0x0; .WORD 0x4; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x4; .WORD 0x0; 
	.WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; 
	.WORD 0x0; .WORD 0x0; .WORD 0x5; .WORD 0x4; .WORD 0x0; .WORD 0x0; .WORD 0x4; .WORD 0x5; .WORD 0x0; .WORD 0x0; 
	.WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x0; .WORD 0x5; .WORD 0x0; .WORD 0x5; .WORD 0x5; .WORD 0x5; 
	.WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x0; .WORD 0x5; .WORD 0x0; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x5; 
	.WORD 0x0; .WORD 0x0; .WORD 0x5; .WORD 0x4; .WORD 0x0; .WORD 0x0; .WORD 0x4; .WORD 0x5; .WORD 0x0; .WORD 0x0; 
	.WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; 
	.WORD 0x0; .WORD 0x4; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x4; .WORD 0x0; 
	.WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x5; .WORD 0x0; .WORD 0x0; .WORD 0x5;
# 实际地图数据： 10 x 10 Addr = 0x00000198
Real_Map:
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; 
	.WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0; .WORD 0x0;

# 开始界面
Welcome:
	# 基地址寄存器 $at
	lui $at, 0xF000;
	ori $at, $at, 0x0000; 		# LED灯地址 		0xF0000000
	# LED灯显示开关信息
	lw $t0, 0($at);
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	sw $t0, 0($at);

	lui $at, 0xE000;
	ori $at, $at, 0x0000; 		# 七段数码管地址	0xE0000000
	sw $zero, 0($at);			# 输出0

#	lui $at, 0xFFFF;
#	ori $at, $at, 0xD000; 		# 模拟器PS2地址 	0xFFFFD000
	lui $at, 0xD000;
	ori $at, $at, 0x0000; 		# 实际PS2地址 	0xD0000000
	lw $t0, 0($at); 			# 获得PS2键盘数据

	addi $t1, $zero, 0x32; 		# 按键B
	beq $t0, $t1, Init;

	j Welcome;

# 主程序初始化
Init:
	addi $t3, $zero, 0x0198; 	# 实际游戏地图的起始地址 0x00000198

	addi $s0, $zero, 2;			# 玩家1横坐标 x1 = 2;
	addi $s1, $zero, 8; 		# 玩家1纵坐标 y1 = 8;
	addi $k0, $t3, 328; 		# 玩家1地图地址 (8 * 10 + 2) * 4 = 328
	
	addi $s2, $zero, 7;			# 玩家2横坐标 x2 = 7;
	addi $s3, $zero, 1; 		# 玩家2纵坐标 y2 = 1;
	addi $k1, $t3, 68; 			# 玩家2地图地址 (1 * 10 + 7) * 4 = 68

	# 初始化地图
	add $t1, $zero, $zero; 					# y = 0
	addi $t5, $zero, 0x0008; 				# 原始地图的起始地址
	Copy_Map_Y:
		slti $t4, $t1, 10; 					# while (y < 10)
		beq $t4, $zero, Copy_Map_Y_End;

		add $t0, $zero, $zero; 				# x = 0
		Copy_Map_X:
			slti $t4, $t0, 10; 				# while (x < 10)
			beq $t4, $zero, Copy_Map_X_End;

			lw $t4, 0($t5); 				# 取原始地图中单元格ID
			sw $t4, 0($t3); 				# 存到实际地图中

			addi $t0, $t0, 1; 				# x ++;
			addi $t5, $t5, 4;
			addi $t3, $t3, 4; 				# 前往下一格
			j Copy_Map_X;
		Copy_Map_X_End:

		addi $t1, $t1, 1; 					# y ++;
		j Copy_Map_Y;
	Copy_Map_Y_End:
	
	# 运动状态: 上 1 左 2 下 3 右 4 静止 0
	add $s4, $zero, $zero; 	# 玩家1运动状态 move1 = 0;
	add $s5, $zero, $zero; 	# 玩家2运动状态 move2 = 0;

	# 玩家图片基地址 --> 默认向下
	lui $gp, 0x5FFE; 		# 取反0x5FFE7CD7
	ori $gp, $gp, 0x7CD7; 
	nor $gp, $gp, $gp;  	# 玩家1图片基地址0xA0018328

	lui $sp, 0xA002; 		
	ori $sp, $sp, 0x4328; 	# 玩家2图片基地址0xA0024328

	# 死亡信息
	add $fp, $zero, $zero;

# 主程序循环
Main:
	lui $at, 0xF000;
	ori $at, $at, 0x0000; 		# LED灯地址 		0xF0000000
	# LED灯显示开关信息
	lw $t0, 0($at);
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	sw $t0, 0($at);

	# 输出坐标数据
	add $t0, $zero, $s0;  		# 玩家1横坐标
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0; 			# 左移8位
	add $t0, $t0, $s1;  		# 玩家1纵坐标
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0; 			# 左移8位
	add $t0, $t0, $s2;  		# 玩家2横坐标
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0;
	add $t0, $t0, $t0; 			# 左移8位
	add $t0, $t0, $s3;  		# 玩家2纵坐标

	lui $at, 0xE000;
	ori $at, $at, 0x0000; 		# 七段数码管地址	0xE0000000
	sw $t0, 0($at);				# 输出坐标数据

P1_Dead:
	lw $t0, 0($k0); 			# 玩家1所在单元格ID
	beq $t0, $zero, P2_Dead;	# 可以为地面 ID = 0
	slti $t1, $t0, 6;
	addi $fp, $zero, 1;
	bne $t1, $zero, Redraw; 	# ID小于6，被炸死，直接重画
	addi $t1, $zero, 15;
	slt $t1, $t1, $t0;
	bne $t1, $zero, Redraw; 	# ID大于15，被炸死，直接重画
	add $fp, $zero, $zero; 		# 否则没死
P2_Dead:
	lw $t0, 0($k1); 			# 玩家2所在单元格ID
	beq $t0, $zero, KeyEvent;	# 可以为地面 ID = 0
	slti $t1, $t0, 6;
	addi $fp, $zero, 1;
	bne $t1, $zero, Redraw; 	# ID小于6，被炸死，直接重画
	addi $t1, $zero, 15;
	slt $t1, $t1, $t0;
	bne $t1, $zero, Redraw; 	# ID大于15，被炸死，直接重画
	add $fp, $zero, $zero; 		# 否则没死

KeyEvent:
	# 按下键盘，改变人物运动状态
#	lui $at, 0xFFFF;
#	ori $at, $at, 0xD000; 		# 模拟器PS2地址 	0xFFFFD000
	lui $at, 0xD000;
	ori $at, $at, 0x0000; 		# 实际PS2地址 	0xD0000000
	lw $t0, 0($at); 			# 获得PS2键盘数据
	andi $t2, $t0, 0x100; 		# 高位为1则为弹起按键

# 放置炸弹
Put_Bomb:
	addi $t1, $zero, 0x29; 		# 按键Space
	beq $t0, $t1, P1_Put_Bomb;
	addi $t1, $zero, 0x5A; 		# 按键Enter
	beq $t0, $t1, P2_Put_Bomb;
	j State_Change;
P1_Put_Bomb:
	addi $t0, $zero, 6;
	sw $t0, 0($k0);  			# 玩家1当前单元格设为炸弹 ID = 6
	j KeyEvent_End;
P2_Put_Bomb:
	addi $t0, $zero, 6;
	sw $t0, 0($k1);  			# 玩家2当前单元格设为炸弹 ID = 6
	j KeyEvent_End;

# 改变运动状态
State_Change:
	andi $t0, $t0, 0xFF; 		# 去除高位标志
	addi $t1, $zero, 0x1d; 		# 按键W
	beq $t0, $t1, P1_Change_Up;
	addi $t1, $zero, 0x1c; 		# 按键A
	beq $t0, $t1, P1_Change_Left;
	addi $t1, $zero, 0x1b; 		# 按键S
	beq $t0, $t1, P1_Change_Down;
	addi $t1, $zero, 0x23; 		# 按键D
	beq $t0, $t1, P1_Change_Right;

	addi $t1, $zero, 0x75; 		# 按键上
	beq $t0, $t1, P2_Change_Up;
	addi $t1, $zero, 0x6b; 		# 按键左
	beq $t0, $t1, P2_Change_Left;
	addi $t1, $zero, 0x72; 		# 按键下
	beq $t0, $t1, P2_Change_Down;
	addi $t1, $zero, 0x74; 		# 按键右
	beq $t0, $t1, P2_Change_Right;
	j KeyEvent_End;

P1_Change_Up:
	addi $s4, $zero, 1;
	# 换为向上图片
	lui $gp, 0xA001;
	ori $gp, $gp, 0x5328; 		# 玩家1 上 	Addr = 0xA0015328
	j P1_Change_UnPress;
P1_Change_Left:
	addi $s4, $zero, 2;
	# 换为向左图片
	lui $gp, 0x5FFE; 			# 相反数 0x5FFE4CD7
	ori $gp, $gp, 0x4CD7;
	nor $gp, $gp, $gp; 			# 玩家1 左 	Addr = 0xA001B328
	j P1_Change_UnPress;
P1_Change_Down:
	addi $s4, $zero, 3;
	# 换为向下图片
	lui $gp, 0x5FFE; 			# 相反数 0x5FFE7CD7
	ori $gp, $gp, 0x7CD7;
	nor $gp, $gp, $gp; 			# 玩家1 下 	Addr = 0xA0018328
	j P1_Change_UnPress;
P1_Change_Right:
	addi $s4, $zero, 4;
	# 换为向右图片
	lui $gp, 0x5FFE; 			# 相反数 0x5FFE1CD7
	ori $gp, $gp, 0x1CD7;
	nor $gp, $gp, $gp; 			# 玩家1 右 	Addr = 0xA001E328
	j P1_Change_UnPress;
P1_Change_UnPress:
	beq $t2, $zero, KeyEvent_End; 	# 如果不为弹起，则结束
	add $s4, $zero, $zero;
	j KeyEvent_End;

P2_Change_Up:
	addi $s5, $zero, 1;
	# 换为向上图片
	lui $sp, 0xA002;
	ori $sp, $sp, 0x1328; 		# 玩家2 上 	Addr = 0xA0021328
	j P2_Change_UnPress;
P2_Change_Left:
	addi $s5, $zero, 2;
	# 换为向左图片
	lui $sp, 0xA002;
	ori $sp, $sp, 0x7328; 		# 玩家2 左 	Addr = 0xA0027328
	j P2_Change_UnPress;
P2_Change_Down:
	addi $s5, $zero, 3;
	# 换为向下图片
	lui $sp, 0xA002;
	ori $sp, $sp, 0x4328; 		# 玩家2 下 	Addr = 0xA0024328
	j P2_Change_UnPress;
P2_Change_Right:
	addi $s5, $zero, 4;
	# 换为向右图片
	lui $sp, 0x5FFD; 			# 相反数 0x5FFD5CD7
	ori $sp, $sp, 0x5CD7;
	nor $sp, $sp, $sp; 			# 玩家2 右 	Addr = 0xA002A328
	j P2_Change_UnPress;
P2_Change_UnPress:
	beq $t2, $zero, KeyEvent_End; 	# 如果不为弹起，则结束
	add $s5, $zero, $zero;
KeyEvent_End:

# 改变玩家位置
#Player1_Move:
	slti $t0, $s4, 1; 			 	# $t0 = (move1 == 0)
	beq $t0, $zero, P1_State1_UP; 	# 运动状态不为0则跳出
	j Player2_Move; 				# 运动状态为0不改变位置
P1_State1_UP:
	slti $t0, $s4, 2; 			 	# $t0 = (move1 == 1)
	beq $t0, $zero, P1_State2_Left; # 运动状态不为1则跳出
	# 判断是否在边界
	beq $s1, $zero, Player2_Move; 	# y = 0 不能向上
	# 判断是否为墙
	addi $t1, $k0, -40; 			# 想去的地图地址 4 * 10 = 40
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Player2_Move; 	# 如果是墙，则不能移动
	# 改变位置
	addi $s1, $s1, -1; 				# y --;
	add $k0, $t1, $zero; 			# 更改地图地址
	j Player2_Move;
P1_State2_Left:
	slti $t0, $s4, 3; 			 	# $t0 = (move1 == 2)
	beq $t0, $zero, P1_State3_Down; # 运动状态不为2则跳出
	# 判断是否在边界
	beq $s0, $zero, Player2_Move; 	# x = 0 不能向左
	# 判断是否为墙
	addi $t1, $k0, -4; 				# 想去的地图地址 4 * 1 = 4
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Player2_Move; 	# 如果是墙，则不能移动
	# 改变位置
	addi $s0, $s0, -1;				# x --;
	add $k0, $t1, $zero; 			# 更改地图地址
	j Player2_Move;
P1_State3_Down:
	slti $t0, $s4, 4; 			 	# $t0 = (move1 == 3)
	beq $t0, $zero, P1_State4_Right;# 运动状态不为3则跳出
	# 判断是否在边界
	slti $t0, $s1, 9;
	beq $t0, $zero, Player2_Move; 	# y = 9 不能向下
	# 判断是否为墙
	addi $t1, $k0, 40; 				# 想去的地图地址 4 * 10 = 40
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Player2_Move; 	# 如果是墙，则不能移动
	# 改变位置
	addi $s1, $s1, 1; 				# y ++;
	add $k0, $t1, $zero; 			# 更改地图地址
	j Player2_Move;
P1_State4_Right:
	slti $t0, $s4, 5; 			 	# $t0 = (move1 == 4)
	beq $t0, $zero, Player2_Move; 	# 运动状态不为4则跳出
	# 判断是否在边界
	slti $t0, $s0, 9; 				
	beq $t0, $zero, Player2_Move; 	# x = 9 不能向右
	# 判断是否为墙
	addi $t1, $k0, 4; 				# 想去的地图地址 4 * 1 = 4
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Player2_Move; 	# 如果是墙，则不能移动
	# 改变位置
	addi $s0, $s0, 1; 				# x ++;
	add $k0, $t1, $zero; 			# 更改地图地址
	j Player2_Move;

Player2_Move:
	slti $t0, $s5, 1; 			 	# $t0 = (move2 == 0)
	beq $t0, $zero, P2_State1_UP; 	# 运动状态不为0则跳出
	j Redraw; 						# 运动状态为0不改变位置
P2_State1_UP:
	slti $t0, $s5, 2; 			 	# $t0 = (move2 == 1)
	beq $t0, $zero, P2_State2_Left; # 运动状态不为1则跳出
	# 判断是否在边界
	beq $s3, $zero, Redraw; 		# y = 0 不能向上
	# 判断是否为墙
	addi $t1, $k1, -40; 			# 想去的地图地址 4 * 10 = 40
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Redraw; 		# 如果是墙，则不能移动
	# 改变位置
	addi $s3, $s3, -1; 				# y --;
	add $k1, $t1, $zero; 			# 更改地图地址
	j Redraw;
P2_State2_Left:
	slti $t0, $s5, 3; 			 	# $t0 = (move2 == 2)
	beq $t0, $zero, P2_State3_Down; # 运动状态不为2则跳出
	# 判断是否在边界
	beq $s2, $zero, Redraw; 		# x = 0 不能向左
	# 判断是否为墙
	addi $t1, $k1, -4; 				# 想去的地图地址 4 * 1 = 4
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Redraw; 		# 如果是墙，则不能移动
	# 改变位置
	addi $s2, $s2, -1; 				# x --;
	add $k1, $t1, $zero; 			# 更改地图地址
	j Redraw;
P2_State3_Down:
	slti $t0, $s5, 4; 			 	# $t0 = (move2 == 3)
	beq $t0, $zero, P2_State4_Right;# 运动状态不为3则跳出
	# 判断是否在边界
	slti $t0, $s3, 9;
	beq $t0, $zero, Redraw; 		# y = 9 不能向下
	# 判断是否为墙
	addi $t1, $k1, 40; 				# 想去的地图地址 4 * 10 = 40
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Redraw; 		# 如果是墙，则不能移动
	# 改变位置
	addi $s3, $s3, 1; 				# y ++;
	add $k1, $t1, $zero; 			# 更改地图地址
	j Redraw;
P2_State4_Right:
	slti $t0, $s5, 5; 			 	# $t0 = (move2 == 4)
	beq $t0, $zero, Redraw; 		# 运动状态不为4则跳出
	# 判断是否在边界
	slti $t0, $s2, 9; 				
	beq $t0, $zero, Redraw; 		# x = 9 不能向右
	# 判断是否为墙
	addi $t1, $k1, 4; 				# 想去的地图地址 4 * 1 = 4
	lw $t2, 0($t1); 				# 取出这一格的单元格ID
	andi $t2, $t2, 0b1100; 			# 高位有值，则为墙体
	bne $t2, $zero, Redraw; 		# 如果是墙，则不能移动
	# 改变位置
	addi $s2, $s2, 1; 				# x ++;
	add $k1, $t1, $zero; 			# 更改地图地址
	j Redraw;

Redraw:
#	lui $at, 0xC;
#	ori $at, $at, 0x2000; 	# 模拟器VGA地址 	0x000C2000
	lui $at, 0xC000;
	ori $at, $at, 0x0000;	# 实际VGA地址 	0xC0000000

	# 遍历地图网格 (10 x 10)
	addi $s7, $zero, 0x0198; 	# 实际地图起始地址 0x00000198
	add $t9, $zero, $zero; 		# 像素点起始地址 addr = 0;
	add $t1, $zero, $zero; 		# y = 0;

	Loop_MapY:
		slti $a3, $t1, 10; 		# while (y < 10)
		beq $a3, $zero, Loop_MapY_end;

		add $t0, $zero, $zero; 		# x = 0;
		Loop_MapX:
			slti $a3, $t0, 10; 		# while (x < 10)
			beq $a3, $zero, Loop_MapX_end;

		# 画单元格像素 $a1 --> 当前颜色
		# 先判断玩家是否在这一格中
		P1_inGrid:
			sub $t2, $s0, $t0; 		# $t2 = (p1_x == nowX)? 0: !0;
			sub $t3, $s1, $t1; 		# $t3 = (p1_y == nowY)? 0: !0;
			bne $t2, $zero, P2_inGrid;
			bne $t3, $zero, P2_inGrid;			# 二者均为真则继续
			lw $t4, 0($k0); 					# 获得这一单元格ID
			slti $t3, $t4, 6;
			beq $t3, $zero, Not_Draw;			# 如果为炸弹，进入计时器交互
			add $t4, $gp, $zero; 				# 换为玩家1图片地址
			j Get_Pixel_Addr;
		P2_inGrid:
			sub $t2, $s2, $t0; 		# $t2 = (p2_x == nowX)? 0: !0;
			sub $t3, $s3, $t1; 		# $t3 = (p2_y == nowY)? 0: !0;
			bne $t2, $zero, Draw_Map;
			bne $t3, $zero, Draw_Map;			# 二者均为真则继续
			lw $t4, 0($k1); 					# 获得这一单元格ID
			slti $t3, $t4, 6;
			beq $t3, $zero, Not_Draw;			# 如果为炸弹，进入计时器交互
			add $t4, $sp, $zero; 				# 换为玩家2图片地址
			j Get_Pixel_Addr;

		# 根据地图的单元格ID获得颜色
		# 地面 ID = 0
		# 爆炸中心 ID = 1
		# 爆炸左右 ID = 2
		# 爆炸上下 ID = 3
		# 墙体 ID = 4
		# 可以炸掉的墙 ID = 5
		# 炸弹 ID = 6
		Draw_Map:
			lw $t4, 0($s7); 				# 获得单元格ID
		Ground_ID0:
			slti $t5, $t4, 1; 				# $t5 = (ID == 0)
			beq $t5, $zero, Bomb_Center_ID1;# ID不为0则跳出
			lui $t4, 0xA000;
			ori $t4, $t4, 0x0328; 			# 地面图片起始地址 0xA0000328
			j Get_Pixel_Addr;
		Bomb_Center_ID1:
			slti $t5, $t4, 2; 				# $t5 = (ID == 1)
			beq $t5, $zero, Bomb_LR_ID2; 	# ID不为1则跳出
			addi $t4, $zero, 16; 			
			sw $t4, 0($s7); 				# 重置计时器 cnt = 16
			lui $t4, 0x5FFF; 				# 构建地址的相反数 0x5FFF3CD7
			ori $t4, $t4, 0x3CD7; 			
			nor $t4, $t4, $t4; 				# 取反获得炸弹中心图片起始地址 0xA000C328
			j Get_Pixel_Addr;
		Bomb_LR_ID2:
			slti $t5, $t4, 3; 				# $t5 = (ID == 2)
			beq $t5, $zero, Bomb_UD_ID3; 	# ID不为2则跳出
			addi $t4, $zero, 16; 			
			sw $t4, 0($s7);					# 重置计时器 cnt = 16
			lui $t4, 0x5FFF; 				# 构建地址的相反数 0x5FFF0CD7
			ori $t4, $t4, 0x0CD7; 			
			nor $t4, $t4, $t4; 				# 取反获得炸弹图片起始地址 0xA000F328
			j Get_Pixel_Addr;
		Bomb_UD_ID3:
			slti $t5, $t4, 4; 				# $t5 = (ID == 3)
			beq $t5, $zero, Barrier_ID4; 	# ID不为3则跳出
			addi $t4, $zero, 16; 			
			sw $t4, 0($s7); 				# 重置计时器 cnt = 16
			lui $t4, 0xA001;
			ori $t4, $t4, 0x2328; 			# 炸弹上下图片起始地址 0xA0012328
			j Get_Pixel_Addr;
		Barrier_ID4:
			slti $t5, $t4, 5; 				# $t5 = (ID == 4)
			beq $t5, $zero, SoftWall_ID5;	# ID不为4则跳出
			lui $t4, 0xA000;
			ori $t4, $t4, 0x3328; 			# 墙体图片起始地址 0xA0003328
			j Get_Pixel_Addr;
		SoftWall_ID5:
			slti $t5, $t4, 6; 				# $t5 = (ID == 5)
			beq $t5, $zero, Bomb_ID6_14;	# ID不为5则跳出
			lui $t4, 0xA000;
			ori $t4, $t4, 0x6328; 			# 可炸掉的墙体图片起始地址 0xA0006328
			j Get_Pixel_Addr;
		Bomb_ID6_14:
			slti $t5, $t4, 15; 				# ID == 6 - 14
			beq $t5, $zero, Not_Draw;		# ID不在范围内则跳出
			addi $t4, $t4, 1; 			
			sw $t4, 0($s7);					# 计时器 cnt ++;
			lui $t4, 0x5FFF; 				# 构建地址的相反数 0x5FFF6CD7
			ori $t4, $t4, 0x6CD7; 			
			nor $t4, $t4, $t4; 				# 取反获得炸弹图片起始地址 0xA0009328
			j Get_Pixel_Addr;
		Not_Draw:
			# 计时器交互，单元格ID充当计时器，用于实现爆炸效果
				slti $t5, $t4, 15; 			# 7 - 14 爆炸前
				bne $t5, $zero, AddCnt;
				slti $t5, $t4, 16;	 		# 15 爆炸前 -> 爆炸中
				bne $t5, $zero, ToBombing;
				slti $t5, $t4, 18; 			# 16 - 17 爆炸中
				bne $t5, $zero, AddCnt;
				j EndBombing; 				# 18 结束爆炸

			AddCnt:
				addi $t4, $t4, 1; 			# cnt ++;
				j SaveBack;
			ToBombing:
				# 设为正在爆炸 --> 十字形
				# 画左边两个
					# 判断是否在边界
					beq $t0, $zero, Right_Bomb; 	# x = 0 不能向左
					addi $a0, $s7, -4; 				# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Right_Bomb; 	# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 2;
					sw $t6, 0($a0); 				# ID 设为2

					addi $t6, $t0, -1; 				# x --;
					# 判断是否在边界
					beq $t6, $zero, Right_Bomb; 	# x = 0 不能向左
					addi $a0, $s7, -8; 				# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Right_Bomb; 	# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 2;
					sw $t6, 0($a0); 				# ID 设为2
				# 画右边两个
				Right_Bomb:
					# 判断是否在边界
					slti $t6, $t0, 9;
					beq $t6, $zero, Up_Bomb; 		# x = 9 不能向右
					addi $a0, $s7, 4; 				# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Up_Bomb; 		# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 2;
					sw $t6, 0($a0); 				# ID 设为2

					addi $t6, $t0, 1; 				# x ++;
					# 判断是否在边界
					slti $t6, $t6, 9;
					beq $t6, $zero, Up_Bomb; 		# x = 9 不能向右
					addi $a0, $s7, 8; 				# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Up_Bomb; 		# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 2;
					sw $t6, 0($a0); 				# ID 设为2
				# 画上边两个
				Up_Bomb:
					# 判断是否在边界
					beq $t1, $zero, Down_Bomb; 		# y = 0 不能向上
					addi $a0, $s7, -40; 			# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Down_Bomb; 		# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 3;
					sw $t6, 0($a0); 				# ID 设为3

					addi $t6, $t1, -1; 				# y --;
					# 判断是否在边界
					beq $t6, $zero, Down_Bomb; 		# y = 0 不能向上
					addi $a0, $s7, -80; 			# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Down_Bomb; 		# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 3;
					sw $t6, 0($a0); 				# ID 设为3
				# 画下边两个
				Down_Bomb:
					# 判断是否在边界
					slti $t6, $t1, 9;
					beq $t6, $zero, Center_Bomb; 	# y = 9 不能向下
					addi $a0, $s7, 40; 				# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Center_Bomb; 	# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 3;
					sw $t6, 0($a0); 				# ID 设为3

					addi $t6, $t1, 1; 				# y ++;
					# 判断是否在边界
					slti $t6, $t6, 9;
					beq $t6, $zero, Center_Bomb; 	# y = 9 不能向下
					addi $a0, $s7, 80; 				# 参数为想去的地址
					jal Judge_CanGo;
					beq $v0, $zero, Center_Bomb; 	# 返回0则不能去
					# 画这一格
					addi $t6, $zero, 3;
					sw $t6, 0($a0); 				# ID 设为3
				# 中心设为爆炸中心图片 ID = 1
				Center_Bomb:
					addi $t4, $zero, 1; 
					j SaveBack;
			EndBombing:
				add $t4, $zero, $zero; 		# 设为地面，结束爆炸
			SaveBack:
				sw $t4, 0($s7); 
				j Loop_GridY_end; 	 		# 不更改显存

		Get_Pixel_Addr:
			add $s6, $t4, $zero; 			# 获得图片像素起始地址

			# 初始化参数，用于遍历单元格像素
			add $t8, $zero, $zero;	# 显存地址 deltaAddr = 0;
			add $t7, $zero, $zero; 	# deltaY = 0;
			Loop_GridY:
				slti $a3, $t7, 48; 		# while (deltaY < 48)
				beq $a3, $zero, Loop_GridY_end;

				add $t6, $zero, $zero; 	# deltaX = 0;
				Loop_GridX:
					slti $a3, $t6, 64; 	# while (deltaX < 64)
					beq $a3, $zero, Loop_GridX_end;

					# 上色
					lw $a1, 0($s6); 	# 取该点像素
					add $t5, $t9, $t8;	# realAddr = addr + deltaAddr;
					
					#add $t5, $t5, $t5;	# 模拟器VGA显示
					#add $t5, $t5, $at;
					#sh $a1, 0($t5);   
					add $t5, $t5, $at;  # 实际VGA显示
					sw $a1, 0($t5);
					
					addi $t6, $t6, 1; 	# deltaX ++;
					addi $t8, $t8, 1; 	# deltaAddr ++;
					addi $s6, $s6, 4;   # deltaPic += 4; --> 下一个像素数据
					j Loop_GridX;
				Loop_GridX_end:

				addi $t7, $t7, 1; 	 # deltaY ++;
				addi $t8, $t8, 576;  # 前往下一行, 640 - 64 = 576
				j Loop_GridY;
			Loop_GridY_end:

			addi $t0, $t0, 1;					# x ++;
			addi $t9, $t9, 64; 					# 前往下一格;
			addi $s7, $s7, 4; 					# 跳到下一个地图数据
			j Loop_MapX;
		Loop_MapX_end:

		addi $t1, $t1, 1; 	  	# y ++;
		addi $t9, $t9, 30080; 	# 前往下一行, 640*48 - 640 = 30080
		j Loop_MapY;
	Loop_MapY_end:

	beq $fp, $zero, Main; 		# 如果没死，重复主循环
	j Player_Dead; 				# 否则死亡

# 玩家死亡后的处理
Player_Dead:
#	lui $at, 0xC;
#	ori $at, $at, 0x2000; 	# 模拟器VGA地址 	0x000C2000
	lui $at, 0xC000;
	ori $at, $at, 0x0000;	# 实际VGA地址 	0xC0000000

	lui $t4, 0x0001;
	ori $t4, $t4, 0x2CA0; 	# 结束界面像素起始地址 160 + 120*640 = 76960 = 0x00012CA0
	lui $t6, 0xB000; 
	ori $t6, $t6, 0x0000;	# 结束界面图片起始地址 Addr = 0xB0000000

	addi $t1, $zero, 120; 			# y = 120;
	End_Y:
		slti $t3, $t1, 360; 		# while (y < 360)
		beq $t3, $zero, End_Y_end;

		addi $t0, $zero, 160; 		# x = 160;
		End_X:
			slti $t3, $t0, 480; 	# while (x < 480)
			beq $t3, $zero, End_X_end;

			#add $t5, $t4, $t4;  	# 模拟器VGA显示
			#add $t5, $t5, $at;
			#sh $zero, 0($t5);   
			add $t5, $t4, $at;  	# 实际VGA显示
			lw $t7, 0($t6);
			sw $t7, 0($t5);

			addi $t0, $t0, 1; 		# x ++;
			addi $t4, $t4, 1; 		# 像素地址 ++;
			addi $t6, $t6, 1; 		# 图片数据地址 ++;
			j End_X;
		End_X_end:

		addi $t1, $t1, 1; 			# y ++;
		addi $t4, $t4, 320; 		# 像素地址前往下一行 640 - (480 - 160);
		j End_Y;
	End_Y_end:

	j Welcome;


# 函数区
# 判断是否为硬墙或炸弹
Judge_CanGo:
	add $v0, $zero, $zero;
	lw $t6, 0($a0); 			# 取出这一格的单元格ID
	addi $t2, $zero, 4; 			
	beq $t6, $t2, Judge_Exit; 	# ID != 4;
	slti $v0, $t6, 6; 			# ID < 6;
Judge_Exit:
	jr $ra;