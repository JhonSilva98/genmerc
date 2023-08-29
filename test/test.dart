import 'package:flutter/material.dart';

ListTile(
                                    leading: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                        size: 100,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2, 2),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Valor pago:",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 170, right: 170),
                                      child: TextFormField(
                                        controller: _valorpago,
                                        minLines: 1,
                                        maxLines: 1,
                                        maxLength: 10,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d{0,2}$')),
                                        ],
                                        onTapOutside: _onsubmited,
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        decoration: InputDecoration(
                                          /*border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors
                                                  .white, // Cor da borda branca
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors
                                                  .white, // Cor da borda branca quando focado
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                          ),*/
                                          hintStyle: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )