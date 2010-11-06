FasdUAS 1.101.10   ��   ��    k             l     ��  ��     -----------------------     � 	 	 . - - - - - - - - - - - - - - - - - - - - - - -   
  
 l     ��  ��    ( " Display Alert 1.2 for LaunchBar 5     �   D   D i s p l a y   A l e r t   1 . 2   f o r   L a u n c h B a r   5      l     ��  ��    J D this script displays a large typed message after a given delay time     �   �   t h i s   s c r i p t   d i s p l a y s   a   l a r g e   t y p e d   m e s s a g e   a f t e r   a   g i v e n   d e l a y   t i m e      l     ��������  ��  ��        l     ��  ��    [ U originally written by ludwigschubert http://forums.obdev.at/viewtopic.php?f=24&t=615     �   �   o r i g i n a l l y   w r i t t e n   b y   l u d w i g s c h u b e r t   h t t p : / / f o r u m s . o b d e v . a t / v i e w t o p i c . p h p ? f = 2 4 & t = 6 1 5      l     ��  ��    < 6 modified by Zettt (http://www.zettt.de) at 2009-05-04     �   l   m o d i f i e d   b y   Z e t t t   ( h t t p : / / w w w . z e t t t . d e )   a t   2 0 0 9 - 0 5 - 0 4     !   l     �� " #��   " \ V thanks to ptujec for providing additional information about changed AppleScript terms    # � $ $ �   t h a n k s   t o   p t u j e c   f o r   p r o v i d i n g   a d d i t i o n a l   i n f o r m a t i o n   a b o u t   c h a n g e d   A p p l e S c r i p t   t e r m s !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) � � Usage: Call LaunchBar, Hit Space, Input your message and provied your delay time at the end in "3s", "1m" or "2d" (without quotes)     * � + +   U s a g e :   C a l l   L a u n c h B a r ,   H i t   S p a c e ,   I n p u t   y o u r   m e s s a g e   a n d   p r o v i e d   y o u r   d e l a y   t i m e   a t   t h e   e n d   i n   " 3 s " ,   " 1 m "   o r   " 2 d "   ( w i t h o u t   q u o t e s )   (  , - , l     �� . /��   . @ : Example: "This is an example message 2s" (without quotes)    / � 0 0 t   E x a m p l e :   " T h i s   i s   a n   e x a m p l e   m e s s a g e   2 s "   ( w i t h o u t   q u o t e s ) -  1 2 1 l     ��������  ��  ��   2  3 4 3 l     �� 5 6��   5 @ : 05/11/09 really minor change by ptujec - just added sound    6 � 7 7 t   0 5 / 1 1 / 0 9   r e a l l y   m i n o r   c h a n g e   b y   p t u j e c   -   j u s t   a d d e d   s o u n d 4  8 9 8 l     �� : ;��   :  -----------------------    ; � < < . - - - - - - - - - - - - - - - - - - - - - - - 9  = > = l     ��������  ��  ��   >  ? @ ? l     ��������  ��  ��   @  A B A i      C D C I      �� E���� 0 handle_string   E  F�� F o      ���� 0 message  ��  ��   D k     ] G G  H I H l     ��������  ��  ��   I  J K J O     [ L M L k    Z N N  O P O l   ��������  ��  ��   P  Q R Q l   �� S T��   S D > set time ... it's the last word of your string e.g. 'test 3'     T � U U |   s e t   t i m e   . . .   i t ' s   t h e   l a s t   w o r d   o f   y o u r   s t r i n g   e . g .   ' t e s t   3 '   R  V W V r    
 X Y X n     Z [ Z 4   �� \
�� 
cwor \ m    ������ [ o    ���� 0 message   Y o      ���� 0 
delay_time   W  ] ^ ] r     _ ` _ c     a b a o    ���� 0 message   b m    ��
�� 
ctxt ` o      ���� 0 future_message   ^  c d c l   ��������  ��  ��   d  e f e l   �� g h��   g &   strip away last word of message    h � i i @   s t r i p   a w a y   l a s t   w o r d   o f   m e s s a g e f  j k j l   ��������  ��  ��   k  l m l r     n o n n     p q p 1    ��
�� 
leng q o    ���� 0 
delay_time   o o      ���� 0 delay_time_length   m  r s r r     t u t n     v w v 1    ��
�� 
leng w o    ���� 0 future_message   u o      ���� 0 message_length   s  x y x l   ��������  ��  ��   y  z { z Z    : | }�� ~ | =       �  o    ���� 0 delay_time_length   � o    ���� 0 message_length   } r   # & � � � m   # $ � � � � �  P i n g � o      ���� 0 future_message  ��   ~ r   ) : � � � c   ) 8 � � � l  ) 6 ����� � n   ) 6 � � � 7  * 6�� � �
�� 
cha  � m   . 0����  � l  1 5 ����� � \   1 5 � � � o   2 3���� 0 message_length   � o   3 4���� 0 delay_time_length  ��  ��   � o   ) *���� 0 future_message  ��  ��   � m   6 7��
�� 
TEXT � o      ���� 0 future_message   {  � � � l  ; ;��������  ��  ��   �  � � � l  ; ;�� � ���   �   display it in large type    � � � � 2   d i s p l a y   i t   i n   l a r g e   t y p e �  � � � I  ; D�� � �
�� .odlbltypnull���     ctxt � o   ; <���� 0 future_message   � �� � �
�� 
pdel � o   = >���� 0 
delay_time   � �� ���
�� 
psnd � m   ? @ � � � � � 
 G l a s s��   �  � � � l  E E��������  ��  ��   �  � � � l  E E��������  ��  ��   �  � � � l  E E�� � ���   �   display growl message    � � � � ,   d i s p l a y   g r o w l   m e s s a g e �  � � � I  E J�� ���
�� .sysodelanull��� ��� nmbr � o   E F���� 0 
delay_time  ��   �  � � � n  K P � � � I   L P�������� 0 growlregister growlRegister��  ��   �  f   K L �  � � � n  Q X � � � I   R X�� ����� 0 growlnotify growlNotify �  � � � m   R S � � � � � 
 T i m e r �  ��� � o   S T���� 0 message  ��  ��   �  f   Q R �  ��� � l  Y Y��������  ��  ��  ��   M m      � ��                                                                                  ODLB  alis    X  Macintosh HD               �Գ�H+     qLaunchBar.app                                                   	$���/        ����  	                Applications    �ԗ�      ��       q  'Macintosh HD:Applications:LaunchBar.app     L a u n c h B a r . a p p    M a c i n t o s h   H D  Applications/LaunchBar.app  / ��   K  ��� � l  \ \��������  ��  ��  ��   B  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 1 + additional scripting for Growlnotification    � � � � V   a d d i t i o n a l   s c r i p t i n g   f o r   G r o w l n o t i f i c a t i o n �  � � � w       � � � k       � �  � � � i     � � � I      �������� 0 growlregister growlRegister��  ��   � O      � � � I   ���� �
�� .registernull��� ��� null��   � �� � �
�� 
appl � m     � � � � �  L a u n c h B a r T i m e r � �� � �
�� 
anot � J     � �  ��� � m    	 � � � � � * M e s s a g e   f r o m   t h e   p a s t��   � � � �
� 
dnot � J     � �  ��~ � m     � � � � � * M e s s a g e   f r o m   t h e   p a s t�~   � �} ��|
�} 
iapp � m     � � � � �  L a u n c h B a r . a p p�|   � m      � �2                                                                                  GRRR  alis    �  Macintosh HD               �Գ�H+   �BGrowlHelperApp.app                                              �^�]3T        ����  	                	Resources     �ԗ�      �]4     �B �> �= �<   �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   �  ��{ � i     � � � I      �z ��y�z 0 growlnotify growlNotify �  � � � o      �x�x 0 grrtitle grrTitle �  ��w � o      �v�v  0 grrdescription grrDescription�w  �y   � O      � � � I   �u�t �
�u .notifygrnull��� ��� null�t   � �s � �
�s 
name � m     � � � � � * M e s s a g e   f r o m   t h e   p a s t � �r � �
�r 
titl � o    	�q�q 0 grrtitle grrTitle � �p � �
�p 
desc � o   
 �o�o  0 grrdescription grrDescription � �n � �
�n 
appl � m     � � � � �  L a u n c h B a r T i m e r � �m ��l
�m 
ifil � m       � t ~ / L i b r a r y / A p p l i c a t i o n   S u p p o r t / L a u n c h B a r / A c t i o n s / T i m e r . s c p t�l   � m     2                                                                                  GRRR  alis    �  Macintosh HD               �Գ�H+   �BGrowlHelperApp.app                                              �^�]3T        ����  	                	Resources     �ԗ�      �]4     �B �> �= �<   �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  �{   �2                                                                                  GRRR  alis    �  Macintosh HD               �Գ�H+   �BGrowlHelperApp.app                                              �^�]3T        ����  	                	Resources     �ԗ�      �]4     �B �> �= �<   �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   � �k l     �j�i�h�j  �i  �h  �k       �g�g   �f�e�d�f 0 handle_string  �e 0 growlregister growlRegister�d 0 growlnotify growlNotify �c D�b�a	�`�c 0 handle_string  �b �_
�_ 
  �^�^ 0 message  �a   �]�\�[�Z�Y�] 0 message  �\ 0 
delay_time  �[ 0 future_message  �Z 0 delay_time_length  �Y 0 message_length  	  ��X�W�V ��U�T�S�R ��Q�P�O�N ��M
�X 
cwor
�W 
ctxt
�V 
leng
�U 
cha 
�T 
TEXT
�S 
pdel
�R 
psnd�Q 
�P .odlbltypnull���     ctxt
�O .sysodelanull��� ��� nmbr�N 0 growlregister growlRegister�M 0 growlnotify growlNotify�` ^� X��i/E�O��&E�O��,E�O��,E�O��  �E�Y �[�\[Zk\Z��2�&E�O����� O�j O)j+ O)�l+ OPUOP �L ��K�J�I�L 0 growlregister growlRegister�K  �J      ��H ��G ��F ��E ��D�C
�H 
appl
�G 
anot
�F 
dnot
�E 
iapp�D 
�C .registernull��� ��� null�I � *����kv��kv��� 
U �B ��A�@�?�B 0 growlnotify growlNotify�A �>�>   �=�<�= 0 grrtitle grrTitle�<  0 grrdescription grrDescription�@   �;�:�; 0 grrtitle grrTitle�:  0 grrdescription grrDescription �9 ��8�7�6 ��5 �4�3
�9 
name
�8 
titl
�7 
desc
�6 
appl
�5 
ifil�4 

�3 .notifygrnull��� ��� null�? � *��������� 
U ascr  ��ޭ